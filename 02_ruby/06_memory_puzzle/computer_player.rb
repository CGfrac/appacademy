class ComputerPlayer
    def initialize(board_size)
        @not_seen = []
        (0...board_size).each do |row|
            (0...board_size).each { |col| @not_seen << [row,col] }
        end
        @not_seen.shuffle!
        @known_cards = {}
        @matched_cards = []
        @next_input = nil
    end

    def eliminate_bomb_coords(board)
        board.bombs.each do |bomb_row, bomb_col|
            @not_seen.select! { |row, col| row != bomb_row || col != bomb_col }
        end
    end

    def receive_card(pos, value)
        if self.match?(value)
            @next_input = self.get_pos(value)
        else
            @known_cards[value] = pos
        end
    end

    def match?(value)
        @known_cards.has_key?(value)
    end

    def get_pos(value)
        @known_cards[value]
    end

    def receive_match(pos1, pos2)
        @matched_cards << pos1
        @matched_cards << pos2
    end

    def prompt
        puts "Computer showing off its superior memory..."
    end

    def get_input
        input = nil
        if @matched_cards.length > 0
            input = @matched_cards.pop
        else
            input = @next_input || @not_seen.pop
            @next_input = nil
        end
        input
    end
end