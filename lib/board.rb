require 'hashable'
class Board
    include Hashable
    attr_accessor :board, :players
    def initialize size = 3
        @players = Array.new
        @board = Array.new(size) { Array.new(size) }
        @winner = nil
        @turn = nil
        @message = nil
    end

    def start_game
        if @players.none? {|player| player != nil}
            puts "The game cannot start, please set 2 players"
        else
            @turn = @players.first
        end
    end

    def reset
        @winner = nil
        @board = Array.new(@board.size) { Array.new(@board.size) }
    end

    def get_board
        export_board = Array.new(@board.size) { Array.new(@board.size) }
        @board.each_with_index {|row, x| row.each_with_index {|cell, y| export_board[x][y] = cell == nil ? nil : {:name => cell.name, :symbol => cell.symbol, :wins => cell.wins}}}
        export_board
    end
    
    def get_players
        export_players = Array.new
        @players.each_with_index {|player, i| export_players.push({:name => player.name, :symbol => player.symbol, :wins => player.wins})}
        export_players
    end

    def set (player, position)
        # Set a player in selected position
        # Position must be an array
        # Player must be Player class
        if @board[position[0]][position[1]] == nil
            @board[position[0]][position[1]] = player
            @message = nil
            self.evaluate
            self.change_turn
        else
            @message = "The selected position is already filled."
        end
    end

    def player_in_turn
        @turn
    end

    def change_turn
        @turn = @turn == @players.first ? @players.last : @players.first
    end

    def has_winner?
        @winner.is_a? Player
    end

    def is_draw?
        @winner == "DRAW"
    end

    def winner
        @winner
    end

    def evaluate
        # Creating array to transpose the board
        transposed = transposed_board
        
        # Checking rows
        @board.map do |row|
            @winner = row.first if row.all? {|cell| cell == row.first and cell.is_a? Player}
        end
        # Checking cols
        transposed.map do |col|
            @winner = col.first if col.all? {|cell| cell == col.first and cell.is_a? Player}
        end

        # Checking main diagonal
        @winner = @board.first.first if (0...@board.size).all? {|key| @board[key][key] == @board.first.first and @board.first.first.is_a? Player}
        
        # Checking main orthogonal diagonal FIX
        @winner = @board.last.first if (0...@board.size).all? {|key| @board[key][@board.size - 1 - key] == @board.last.first and @board.last.first.is_a? Player}

        # Set the winner Player as a winner
        @winner.won if @winner != nil


        # Check if draw
        @winner = "DRAW" if @board.all? {|row| row.all? {|cell| cell != nil}} and @winner == nil

        # Returns winner
        @winner
    end

    def transposed_board
        transposed = Array.new(@board.size) { Array.new(@board.size) }
        # Filling transposed
        @board.each_with_index do |row, x|
            row.each_with_index do |cell, y|
                transposed[y][x] = cell                  
            end
        end
        transposed
    end

    def message
        @message
    end

    def add_player name, symbol
        @players.push Player.new name, symbol
    end

end
