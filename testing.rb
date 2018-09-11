require_relative 'lib/tictactoe'

puts "Welcome to Tic-Tac-Toe"

t = Tictactoe.new 2

grid = t.getGrid

grid.players.each do |player| 
    puts "#{player.name} => #{player.symbol}"
end
puts grid.size
