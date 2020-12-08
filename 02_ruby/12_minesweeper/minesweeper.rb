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

    def reveal_tile
        if @board[*@board.cursor_pos].bombed
            @board.boom
            @boom = true
        else
            @board.reveal
        end
    end

    def prompt
        puts "Move the cursor using arrow keys"
        puts "Type 'r' to reveal, 'f' to flag, 's' to save, 'q' to quit"
    end

    def get_time
        current_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        (current_time - @starting_time).round(3)
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
            @board.cursor_pos[0] = [0, @board.cursor_pos[0] - 1].max
        when "\e[B" # down
            @board.cursor_pos[0] = [@board.height-1, @board.cursor_pos[0] + 1].min
        when "\e[C" # right
            @board.cursor_pos[1] = [@board.width-1, @board.cursor_pos[1] + 1].min
        when "\e[D" # left
            @board.cursor_pos[1] = [0, @board.cursor_pos[1] - 1].max
        when "r"
            self.reveal_tile
        when "f"
            @board.switch_flag
        when 's'
            save_game
        when 'q'
            exit
        end
    end

    def victory_message
        @board.render
        puts "Good job! Your time is #{@ending_time}"
    end

    def record_time
        if file?("test")
            times = YAML::load_file("times")
        else
            times = []
        end
        times << @ending_time
        times.sort!
        File.write("times", times[0..9])
    end

    def run
        @starting_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        until over?
            @board.render
            self.prompt
            self.get_input 
        end
        @ending_time = self.get_time
        unless @boom
            self.victory_message
            self.record_time
        end
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