class Board
    def initialize (players)
        @players = players
        @board = Array.new(3) { Array.new(3) }
        @winner = nil
    end

    def show # To be used: ╔╗ ═║ ╚╝ ╩╦ ╬ ╠╣
        # Checks if player has won
        if @winner != nil
            puts "The winenr is #{@winner.name}"
        else
            puts "No winner yet"
        end

        output =  "\n╔═══╦═══╦═══╗\n"
        @board.each_with_index do |row, i|
            row.each do |cell| # Fills each cell of the board that each player has taken
                output += "║ "
                if cell == nil
                    output += "  "
                else
                    output += cell.symbol + " "
                end
            end
            output += "║\n"
            if i != @board.length-1 # Print the horizontal line if is not the last row
                output += "╠═══╬═══╬═══╣\n"
            end
        end
        output += "╚═══╩═══╩═══╝\n"
        puts output
    end

    def set (player, position)
        # Set a player in selected position
        # Position must be an array
        # Player must be Player class
        @board[position[0]][position[1]] = player
        self.evaluate
    end

    def evaluate
        # Creating array to transpose the board
        transposed = transposed_board
        
        # Checking rows
        @board.map do |row|
            @winner = row.first if row.all? {|cell| cell == row.first and cell.is_a? Player}
        end
        # Checking cols
        transposed.map do |col|
            @winner = col.first if col.all? {|cell| cell == col.first and cell.is_a? Player}
        end

        # Checking main diagonal
        @winner = @board.first.first if (0...@board.size).all? {|cell| cell == @board.first.first and cell.is_a? Player}
        
        # Checking transposed main diagonal
        @winner = transposed.first.first if (0...transposed.size).all? {|cell| cell == transposed.first.first and cell.is_a? Player}

        # Set the winner Player as a winner
        @winner.won if @winner != nil

        # Returns winner
        @winner
    end

    def transposed_board
        transposed = Array.new(3) { Array.new(3) }
        # Filling transposed
        @board.each_with_index do |row, x|
            row.each_with_index do |cell, y|
                transposed[y][x] = cell                  
            end
        end
        transposed
    end

    # Define Players
    def players
        return @players
    end

    def players=(new_players)
        self.players = new_players
    end

end
