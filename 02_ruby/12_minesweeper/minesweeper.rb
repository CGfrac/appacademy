require "yaml"
require "set"
require_relative "board.rb"

class Minesweeper
    VALID_COMMANDS = Set['r', 'f', 's', 'q']

    def initialize
        @board = Board.new
    end

    def over?
        @board.remaining_tiles == 0 || @boom
    end

    def valid_command?(cmd)
        VALID_COMMANDS.include?(cmd)
    end

    def save_game
        print "Give your save a name: "
        input = gets.chomp
        File.write(input, self.to_yaml)
    end

    def get_command
        cmd = nil
        until cmd
            print "Enter a command ('r' to reveal, 'f' for flagging, 's' to save, 'q' to quit): "
            input = gets.chomp
            cmd = input if self.valid_command?(input)
            if cmd == 's'
                self.save_game
                cmd = nil
            elsif cmd == 'q'
                exit
            end
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
        self.victory_message unless @boom
    end
end

if __FILE__ == $PROGRAM_NAME
    save = ARGV.shift
    if save
        game = YAML::load_file(save)
    else
        game = Minesweeper.new
    end
    sleep(5)
    game.run
end