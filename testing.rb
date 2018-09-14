require_relative 'lib/classes/player'
require_relative 'lib/classes/tictactoe'
require_relative 'lib/classes/keyboard'

puts "Welcome to Tic-Tac-Toe"

tictactoe = Tictactoe.new
board = tictactoe.get_board

print "Player 1 name: "
board.add_player gets.chomp, "X"

print "Player 2 name: "
board.add_player gets.chomp, "O"

keyboard = Keyboard.new
user_action = nil

until user_action == "\e" or user_action == "EXIT" # Stop on press ESC
    system "clear" or system "cls"
    board.show_leaderboard
    board.show
    puts board.message if board.message != nil
    if board.has_winner? or board.is_draw?
        puts "The winner is #{board.winner.name}" if board.has_winner?
        puts "DRAW!!!" if board.is_draw?
        puts "Do you want to play again? (Y/n)"
        play_again = gets.chomp
        play_again.downcase
        if play_again != "n"
            board.reset
        else
            user_action = "EXIT"
        end
    else
        puts "Turn of #{board.player_in_turn.name}(#{board.player_in_turn.symbol})"
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
