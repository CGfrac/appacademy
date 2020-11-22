class ComputerPlayer
    def initialize(board_size)
        @not_seen = []
        (0...board_size).each do |row|
            (0...board_size).each { |col| @not_seen << [row,col] }
        end
        @not_seen.shuffle!
        @known_cards = Hash.new { |h,k| h[k] = [] }
        @matched_cards = []
        @next_inputs = []
    end

    def eliminate_bomb_coords(board)
        board.bombs.each do |bomb_row, bomb_col|
            @not_seen.select! { |row, col| row != bomb_row || col != bomb_col }
        end
    end

    def receive_card(pos, value)
        if self.matches?(value)
            @next_inputs = self.get_positions(value)
        else
            @known_cards[value] << pos
        end
    end

    def matches?(value)
        @known_cards.has_key?(value)
    end

    def number_matches(value)
        @known_cards[value].length
    end

    def get_positions(value)
        @known_cards[value]
    end

    def receive_matches(pos1, value)
        @matched_cards += [pos1] + self.get_positions(value)
    end

    def prompt
        puts "Computer showing off its superior memory..."
    end

    def get_input
        input = nil
        if @matched_cards.length > 0
            input = @matched_cards.pop
        else
            input = @next_inputs.pop || @not_seen.pop
        end
        input
    end
end