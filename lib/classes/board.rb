class Board
    def initialize (players)
        @players = players
        @board = Array.new(3) { Array.new(3) }
        @winner = nil
    end

    def show # To be used: ╔╗ ═║ ╚╝ ╩╦ ╬ ╠╣
        # Checks if player has won
        if @winner == nil
            puts "THE WINNER IS #{@winner.name}"
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
        @board.map |row| do
            @winner = row if row.all? {|cell| cell == row.first}
        end
        # Checking cols
        transposed.map |col| do
            @winner = col if col.all? {|cell| cell == col.first}
        end

        # Checking main diagonal
        @winner = @board.first.first if (0...@board.size).all? {|cell| cell == @board.first.first}
        
        # Checking transposed main diagonal
        @winner = transposed.first.first if (0...transposed.size).all? {|cell| cell == transposed.first.first}
    end

    def transposed_board
        treansposed = Array.new(3) { Array.new(3) }
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
