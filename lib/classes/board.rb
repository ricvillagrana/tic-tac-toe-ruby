class Board
    def initialize (players, size)
        @size = size
        @players = players
        @board = Array.new(size) { Array.new(size) }
    end

    def show # ╔╗ ═║ ╚╝ ╩╦ ╬ ╠╣
        output =  "\n╔═══╦═══╦═══╗\n"
        @board.each_with_index do |row, i|
            row.each do |cell|
                output += "║ "
                if cell == nil
                    output += "  "
                else
                    output += cell.symbol + " "
                end
            end
            output += "║\n"
            if i != @board.length-1
                output += "╠═══╬═══╬═══╣\n"
            end
        end
        output += "╚═══╩═══╩═══╝\n"
        puts output
    end

    def set (player, position)
        @board[position[0]][position[1]] = player
    end

    # Define Size
    def size
        return @size
    end

    def size=(new_size)
        self.size = new_size
    end

    # Define Players
    def players
        return @players
    end

    def players=(new_players)
        self.players = new_players
    end

end
