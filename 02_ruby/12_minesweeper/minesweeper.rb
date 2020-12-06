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
            cmd = input if self.valid_command?(input)
        end
        cmd
    end

    def valid_position?(pos)
        pos.length == 2 && pos[0].between?(0, @board.height-1) && pos[1].between?(0, @board.width-1)
    end

    def get_position
        pos = nil
        until pos
            print "Enter coordinates in 'row,col' form (e.g. '2,3'): "
            input = gets.chomp.split(',').map { |coord| Integer(coord) }
            pos = input if self.valid_position?(input)
        end
        pos
    end

    def get_input
        command = self.get_command
        position = self.get_position
        [command, position]
    end

    def play_turn
        command, position = self.get_input
        @board[*position].reveal
    end

    def run
        until over?
            @board.render
            self.play_turn
        end
    end
end