class Player
    def initialize (name = "unnamed", symbol = nil)
        @name = name.capitalize
        @symbol = symbol
        @wins = 0
    end
    
    def won
        @wins += 1
    end
    def wins
        @wins
    end

    def name
        @name
    end
    def name=(name)
        @name = name
    end
    
    def symbol=(symbol)
        @symbol = symbol
    end
    def symbol
        @symbol
    end
end
