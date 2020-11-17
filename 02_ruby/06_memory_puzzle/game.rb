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
        current_guess = @board[*guessed_pos]
        current_guess.reveal
        if @previous_guess
            unless current_guess.to_s == @previous_guess.to_s
                current_guess.hide
                @previous_guess.hide
                puts "Try again."
            end
            @previous_guess = nil
        else
            @previous_guess = current_guess
        end
    end

    def play
        until self.over?
            @board.render
            puts "Please enter the position that you'd like to flip (e.g. '2,3')"
            pos = gets.chomp.split(',').map { |ele| ele.to_i }
            self.check_guess(pos)
        end
    end
end