class Grid do
    def initialize (players, size)
        self.size       = size
        self.players    = players
        
    end

    # Define Size
    def size
        @size
    end

    def size=(new_size)
        self.size = new_size
    end

    # Define Players
    def players
        @players
    end

    def players=(new_players)
        self.players = new_players
    end

end