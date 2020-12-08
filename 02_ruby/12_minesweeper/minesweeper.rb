require "yaml"
require 'io/console'
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
        puts "Move the cursor using arrow keys"
        puts "Type 'r' to reveal, 'f' to flag, 's' to save, 'q' to quit"
    end

    # Taken from https://gist.github.com/acook/4190379
    def read_char
        STDIN.echo = false
        STDIN.raw!

        input = STDIN.getc.chr
        if input == "\e" then
            input << STDIN.read_nonblock(3) rescue nil
            input << STDIN.read_nonblock(2) rescue nil
        end
    ensure
        STDIN.echo = true
        STDIN.cooked!

        return input
    end

    def get_input
        input = read_char

        case input
        when "\e[A" # up
        when "\e[B" # down
        when "\e[C" # right
        when "\e[D" # left
        when "r"
        when "f"
        when 's'
            save_game
        when 'q'
            exit
        else
            sleep(1)
        end
    end

    def victory_message
        @board.render
        puts "Good job!"
    end

    def run
        until over?
            @board.render
            self.prompt
            self.get_input 
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