require_relative 'classes/board'
require_relative 'classes/player'
=begin
    TODO: Create the game logic
    TODO: Create the gem that contains that logic and verify that can be used correctly
    TODO: Create terminal interface
    TODO: Create GUI interface (Shoes or Gosu)
    TODO: Create web app
    TODO: Create API
=end

class Tictactoe
    def initialize (size = 0, number_players = 2)
        # Check that size is equals or greater than 2
        if size < 3
            size = 3
        end
        
        # Initialize players array
        @players = []
        # Initialize number of players (Default value sould be 2 or grater)
        @players_quantity = number_players

        # Fill players array
        for i in 0..@players_quantity-1
            puts "Name of Player #{i+1}: "
            name = gets.chomp
            #puts "Symbol of #{name.capitalize!}: "
            #symbol = gets.chomp
            if i == 0 
                symbol = "o"
            else
                symbol = "×"
            end
            @players.push(Player.new(name, symbol))
        end

        @board = Board.new @players, size
    end

    def getBoard
        @board
    end
    
end
