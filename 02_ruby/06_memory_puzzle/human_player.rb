class HumanPlayer
    def prompt
        puts "Please enter the position that you'd like to flip (e.g. '2,3')"
    end

    def get_input
        gets.chomp.split(',').map { |ele| ele.to_i }
    end
end