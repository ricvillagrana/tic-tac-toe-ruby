require_relative 'lib/tictactoe'

puts "Welcome to Tic-Tac-Toe"

t = Tictactoe.new 2

board = t.getBoard

system "clear" or system "cls"

puts "PLAYERS:"
board.players.each do |player| 
    puts "#{player.name} => #{player.symbol}"
end

board.set(board.players[0], [0,0])
board.set(board.players[1], [1,1])
board.set(board.players[0], [2,0])
board.set(board.players[1], [2,1])
board.set(board.players[0], [2,2])

board.show
