class HumanPlayer
    VALID_INPUTS = "0123456789 "
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        puts "#{@mark_value} turn"
        valid = false
        while !valid
            puts "Enter the position of your mark using the format 'row col', e.g. 0 2"
            input = gets.chomp

            if input.count(' ') != 1 || input.split.length != 2
                raise "Wrong input"
            end
            input.each_char do |char|
                if !VALID_INPUTS.include?(char)
                    raise "Wrong input"
                end
            end
            
            position = input.split.map { |coord| coord.to_i }

            if legal_positions.include?(position)
                valid = true
            else
                puts "#{position} is not a legal position"
            end
        end
        position
    end
end