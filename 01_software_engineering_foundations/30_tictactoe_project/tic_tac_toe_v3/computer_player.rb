class ComputerPlayer
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        position = legal_positions.sample
        puts "#{@mark_value} playing at #{position[0]} #{position[1]}"
        position
    end
end