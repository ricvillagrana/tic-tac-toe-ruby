require_relative 'board'
require_relative 'player'

class TictactoeLogic
    def initialize size
        @board = Board.new size
    end

    def get_board
        @board
    end
    
end
