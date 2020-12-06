require_relative "board.rb"

class Minesweeper
    def initialize
        @board = Board.new
    end

    def over?
        @board.remaining_tiles == 0
    end

    def get_input
        puts "Enter a command ('r' to reveal, 'f' for flagging)"
        puts "Followed by the coordinates, e.g. 'r 2,3'"
        until input
            begin
                input = gets.chomp.split
                command, pos = parse_input(input)
            rescue
                input = nil
            end
        end
        input
    end
end