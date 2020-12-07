require "yaml"
require_relative "board.rb"

class Minesweeper
    def initialize
        @board = Board.new
    end

    def over?
        @board.remaining_tiles == 0 || @boom
    end

    def save_game
        print "Give your save a name: "
        input = gets.chomp
        File.write(input, self.to_yaml)
    end

    def reveal_tile(position)
        if @board[*position].bombed
            @board.boom
            @boom = true
        else
            @board[*position].reveal
        end
    end

    def prompt
    end

    def play_turn
        self.prompt
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
    game.run
end