require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
    def initialize(player)
        @board = Board.new
        @previous_guess = nil
        @player = player
    end

    def over?
        @board.won?
    end
    
    def check_guess(guessed_pos)
        value = @board.reveal(guessed_pos)

        if @previous_guess
            previous_value = @board.reveal(@previous_guess)
            unless value == previous_value
                @board.render
                puts "Try again."
                sleep(2)
                @board[*guessed_pos].hide
                @board[*@previous_guess].hide
                if @player.match?(value)
                    @player.receive_match(guessed_pos, @player.get_pos(value))
                else
                    @player.receive_card(guessed_pos, value)
                end
            end
            @previous_guess = nil
        else
            @previous_guess = guessed_pos
            @player.receive_card(guessed_pos, value)
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