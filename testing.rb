require_relative 'lib/classes/player'
require_relative 'lib/classes/tictactoe'

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

board.show

board.set(player1, [0,0])
board.set(player1, [0,1])
board.set(player1, [0,2])
board.set(player1, [1,1])
board.evaluate

board.show
