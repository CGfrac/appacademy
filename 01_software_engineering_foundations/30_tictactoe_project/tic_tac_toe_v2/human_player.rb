class HumanPlayer
    VALID_INPUTS = "0123456789 "
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        puts "#{@mark_value} turn"
        puts "Enter the position of your mark by leaving a space between each of the two numbers, e.g. 0 2"
        position = gets.chomp

        if position.count(' ') != 1 || position.split.length != 2
            raise "Wrong input"
        end
        position.each_char do |char|
            if !VALID_INPUTS.include?(char)
                raise "Wrong input"
            end
        end
        
        position.split.map { |coord| coord.to_i }
    end
end