require_relative "board.rb"

class Game
    def initialize(file_path)
        grid = Board.from_file(file_path)
        @board = Board.new(grid)
    end

    def prompt
        puts "Enter coordinates followed by a value between 1 and 9 (e.g. 0 2 7)"
    end

    def wrong_number_arguments?(input)
        input.length != 3
    end

    def out_of_range?(value, range)
        value < range[0] || value > range[1]
    end

    def not_a_number?(str)
        !"0123456789".include?(str)
    end

    def invalid_coordinates?(coordinates)
        coordinates.any? do |coord| 
            self.not_a_number?(coord) || self.out_of_range?(coord.to_i, [0,8])
        end
    end

    def invalid_tile_value?(value)
        self.not_a_number?(value) || self.out_of_range?(value.to_i, [1,9])
    end

    def valid_input?(input)
        if self.wrong_number_arguments?(input)
            puts "Wrong number of arguments"
            false
        elsif self.invalid_coordinates?(input[0..1])
            puts "Invalid coordinates"
            false
        elsif self.invalid_tile_value?(input[2])
            puts "Invalid tile value"
            false
        else
            true
        end
    end

    def get_input
        while true
            input = gets.chomp.split
            break if valid_input?(input)
        end
        input
    end

    def coordinates_to_i(coordinates)
        coordinates.map { |coord| coord.to_i }
    end

    def play
        until @board.solved?
            system("clear")
            @board.render
            self.prompt
            input = self.get_input
            coords = self.coordinates_to_i(input[0..1])
            @board.update_tile(coords, input[2])
        end
        system("clear")
        @board.render
        puts "Solved!"
    end
end