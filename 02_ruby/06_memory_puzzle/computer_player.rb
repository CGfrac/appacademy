class ComputerPlayer
    def initialize(board_width)
        positions = []
        (0..board_width).each do |i|
            (0..board_width).each { |j| positions << [i, j] }
        end
        @known_cards = {}
        @matched_cards = []
        @next_input = nil
    end

    def receive_card(pos, value)
        if @known_cards.has_key?(value)
            self.receive_match(pos, @known_cards[value])
            return
        end
        @known_cards[value] = pos
    end

    def receive_match(pos1, pos2)
        @matched_cards << [pos1, pos2]
    end

    def prompt
        puts "Computer showing off its superior memory..."
    end

    def get_input
        input = nil
        if @next_input
            input = @next_input[0..1]
            @next_input = nil
        elsif @matched_cards.length > 0
            matched = @matched_cards.pop
            input = matched.pop
            @next_input = matched.pop
        else
            index = rand(0...positions.length)
            input = positions[index]
        end
        input
    end
end