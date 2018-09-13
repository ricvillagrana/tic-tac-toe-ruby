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

until user_action == "\e" or user_action == "EXIT" # Stop on press ESC
    system "clear" or system "cls"
    board.show_leaderboard
    board.show
    if board.has_winner?
        puts "The winner is #{board.winner.name}"
        puts "Do you want to play again? (Y/n)"
        play_again = gets.chomp
        play_again.downcase
        if play_again == "y"
            board.reset
        else
            user_action = "EXIT"
        end
    else
        user_action = keyboard.read.downcase
        case user_action
            when "7" then board.set(board.player_in_turn, [0,0])
            when "8" then board.set(board.player_in_turn, [0,1])
            when "9" then board.set(board.player_in_turn, [0,2])
            when "4" then board.set(board.player_in_turn, [1,0])
            when "5" then board.set(board.player_in_turn, [1,1])
            when "6" then board.set(board.player_in_turn, [1,2])
            when "1" then board.set(board.player_in_turn, [2,0])
            when "2" then board.set(board.player_in_turn, [2,1])
            when "3" then board.set(board.player_in_turn, [2,2])
        end
    end
end
