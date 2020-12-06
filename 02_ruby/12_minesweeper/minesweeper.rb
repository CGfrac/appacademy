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

    def get_position
        pos = nil
        until pos
            print "Enter coordinates in 'row,col' form (e.g. '2,3'): "
            input = gets.chomp.split(',').map { |coord| Integer(coord) }
            pos = input if valid_position?(input)
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