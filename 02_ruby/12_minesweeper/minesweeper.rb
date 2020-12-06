require_relative "board.rb"

class Minesweeper
    def initialize
        @board = Board.new
    end

    def over?
        @board.remaining_tiles == 0
    end

    def valid_command?(cmd)
        cmd == 'r' || cmd == 'f'
    end

    def get_command
        cmd = nil
        until cmd
            print "Enter a command ('r' to reveal, 'f' for flagging): "
            input = gets.chomp
            cmd = input if valid_command?(input)
        end
    end

    def get_input
        puts "Followed by the coordinates, e.g. 'r 2,3'"
        input = nil
        until input
            begin
                command = get_command
                position = get_position
            rescue
                input = nil
            end
        end
        input
    end
end