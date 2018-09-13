require_relative 'board'
require_relative 'player'
=begin
    TODO: Create the game logic
    TODO: Create the gem that contains that logic and verify that can be used correctly
    TODO: Create terminal interface
    TODO: Create GUI interface (Shoes or Gosu)
    TODO: Create web app
    TODO: Create API
=end

class Tictactoe
    def initialize (players)
        @board = Board.new players
    end

    def getBoard
        @board
    end
    
end
