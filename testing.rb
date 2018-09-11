require_relative 'lib/tictactoe'

puts "Welcome to Tic-Tac-Toe"

t = Tictactoe.new 2

board = t.getBoard

board.players.each do |player| 
    puts "#{player.name} => #{player.symbol}"
end
puts board.size
board.show
