require_relative 'lib/classes/player'
require_relative 'lib/classes/tictactoe'
require_relative 'lib/classes/keyboard'

puts "Welcome to Tic-Tac-Toe"

print "Player 1 name: "
player1_name = gets.chomp
player1 = Player.new player1_name, "X"

print "Player 2 name: "
player2_name = gets.chomp
player2 = Player.new player2_name, "O"

players = Array.new
players.push player1, player2

game = Tictactoe.new players

board = game.get_board

keyboard = Keyboard.new
user_action = nil

until user_action == "\e" # Stop on press ESC
    board.show
    case user_action
        when "q" then board.set(player1, [0,0])
        when "w" then board.set(player1, [0,1])
        when "e" then board.set(player1, [0,2])
    end
    user_action = keyboard.read.downcase
end
