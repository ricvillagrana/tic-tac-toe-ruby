class Grid
    def initialize (players, size)
        @size = size
        @players = players
        
    end

    # Define Size
    def size
        return @size
    end

    def size=(new_size)
        self.size = new_size
    end

    # Define Players
    def players
        return @players
    end

    def players=(new_players)
        self.players = new_players
    end

end
