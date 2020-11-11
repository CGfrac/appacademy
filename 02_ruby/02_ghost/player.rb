class Player
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def guess
        gets.chomp.downcase
    end

    def alert_invalid_guess
        puts "This input is invalid."
    end
end