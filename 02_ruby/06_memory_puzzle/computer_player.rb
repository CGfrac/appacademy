class ComputerPlayer
    def initialize
        @known_cards = {}
        @matched_cards = {}
    end

    def receive_card(pos, value)
        @known_cards[value] = pos
    end
end