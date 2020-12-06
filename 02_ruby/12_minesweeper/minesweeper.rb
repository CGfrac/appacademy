require_relative "board.rb"

class Minesweeper
    def initialize
        @board = Board.new
    end

    def over?
        @board.remaining_tiles == 0 || @boom
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
            begin 
                input = gets.chomp.split(',').map { |coord| Integer(coord) }
                pos = input if self.valid_position?(input)
            rescue
                pos = nil
            end
        end
        pos
    end

    def get_input
        command = self.get_command
        position = self.get_position
        [command, position]
    end

    def reveal_tile(position)
        if @board[*position].bombed
            @board.boom
            @boom = true
        else
            @board[*position].reveal
        end
    end

    def play_turn
        command, position = self.get_input
        if command == 'f'
            @board[*position].switch_flag
        else
            self.reveal_tile(position)
        end
    end

    def victory_message
        @board.render
        puts "Good job!"
    end

    def run
        until over?
            @board.render
            self.play_turn
        end
        self.victory_message unless @bombed
    end
end