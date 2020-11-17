require_relative "board.rb"
require_relative "human_player.rb"

class Game
    def initialize
        @board = Board.new
        @previous_guess = nil
        @player = HumanPlayer.new
    end

    def over?
        @board.won?
    end

    def check_guess(guessed_pos)
        current_guess = @board[*guessed_pos]
        current_guess.reveal
        if @previous_guess
            unless current_guess.to_s == @previous_guess.to_s
                @board.render
                puts "Try again."
                sleep(2)
                current_guess.hide
                @previous_guess.hide
            end
            @previous_guess = nil
        else
            @previous_guess = current_guess
        end
    end

    def play
        until self.over?
            @board.render
            @player.prompt
            pos = @player.get_input
            self.check_guess(pos)
        end
        @board.render
        puts "Good job!"
    end
end