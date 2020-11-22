require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
    def initialize(player, board_size, bombs=false)
        @turn_limit = board_size * board_size
        @board = Board.new(board_size, bombs)
        @previous_guess = nil
        @player = player
    end

    def over?
        @board.won? || @turn_limit == 0
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
            @turn_limit -= 1
        else
            @previous_guess = guessed_pos
            @player.receive_card(guessed_pos, value)
        end
    end

    def play
        until self.over?
            @board.render
            puts "#{@turn_limit} turn(s) left."
            @player.prompt
            pos = @player.get_input
            self.check_guess(pos)
        end
        @board.render
        if @turn_limit == 0
            puts "Game Over"
        else
            puts "Good job!"
        end
    end
end

if __FILE__ == $PROGRAM_NAME
    player = HumanPlayer
    board_size = 4
    bombs = false
    while true
        puts "Welcome to the memory puzzle! Type 'help' to list available commands."
        cmd = gets.chomp
        case cmd
        when "start"
            game = Game.new(player.new(board_size), board_size, bombs)
            game.play
        when "normal_mode"
            board_size = 4
        when "hard_mode"
            board_size = 6
        when "bomb_mode"
            bombs = true
        when "player_mode"
            player = HumanPlayer
        when "cpu_mode"
            player = ComputerPlayer
        when "quit"
            break
        when "help"
            puts "normal_mode - set board's width to 4 (default)"
            puts "hard_mode - set board's width to 6"
            puts "player_mode - set human player (default)"
            puts "cpu_mode - set computer player"
            puts "quit - exit program"
        else
            puts "Wrong command, type 'help' if necessary."
        end
    end
end