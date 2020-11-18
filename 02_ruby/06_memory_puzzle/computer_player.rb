class ComputerPlayer
    def initialize
        @known_cards = {}
        @matched_cards = []
    end

    def receive_card(pos, value)
        @known_cards[value] = pos
    end

    def receive_match(pos1, pos2)
        @matched_cards << [pos1, pos2]
    end
end