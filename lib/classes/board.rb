class Board
    def initialize (players)
        @players = players
        @board = Array.new(3) { Array.new(3) }
        @winner = nil
        @turn = players.first
        @message = nil
    end

    def reset
        @winner = nil
        @board = Array.new(3) { Array.new(3) }
    end

    def show # To be used: ╔╗ ═║ ╚╝ ╩╦ ╬ ╠╣
        output =  "\n╔═══╦═══╦═══╗\n"
        @board.each_with_index do |row, i|
            row.each do |cell| # Fills each cell of the board that each player has taken
                output += "║ "
                if cell == nil
                    output += "  "
                else
                    output += "#{cell.symbol} "
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

    def show_leaderboard
        @players.map {|player| puts "#{player.name} (#{player.symbol}) has won #{player.wins} times."}
    end

    def set (player, position)
        # Set a player in selected position
        # Position must be an array
        # Player must be Player class
        if @board[position[0]][position[1]] == nil
            @board[position[0]][position[1]] = player
            @message = nil
            self.evaluate
            self.change_turn
        else
            @message = "The selected position is already filled."
        end
    end

    def player_in_turn
        @turn
    end

    def change_turn
        @turn = @turn == @players.first ? @players.last : @players.first
    end

    def has_winner?
        @winner.is_a? Player
    end

    def is_draw?
        @winner == "DRAW"
    end

    def winner
        @winner
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
        @winner = @board.first.first if (0...@board.size).all? {|key| @board[key][key] == @board.first.first and @board.first.first.is_a? Player}
        
        # Checking main orthogonal diagonal FIX
        @winner = @board.last.first if (0...@board.size).all? {|key| @board[key][@board.size - 1 - key] == @board.last.first and @board.last.first.is_a? Player}

        # Set the winner Player as a winner
        @winner.won if @winner != nil


        # Check if draw
        @winner = "DRAW" if @board.all? {|row| row.all? {|cell| cell != nil}}

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

    def message
        return @message
    end

    def players
        return @players
    end

    def players=(new_players)
        self.players = new_players
    end

end
