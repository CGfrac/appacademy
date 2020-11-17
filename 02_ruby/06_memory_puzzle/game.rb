require_relative "board.rb"

class Game
    def initialize
        @board = Board.new
        @previous_guess = nil
    end

    def over?
        @board.won?
    end

    def check_guess(guessed_pos)
        current_guess = @board.reveal(guessed_pos)
        if @previous_guess
            unless current_guess == @previous_guess
                current_guess.hide
                @previous_guess.hide
            end
            @previous_guess = nil
        else
            @previous_guess = current_guess
        end
    end
end