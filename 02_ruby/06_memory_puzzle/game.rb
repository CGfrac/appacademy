require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
    def initialize(player, board_size, bombs=false)
        @turns_left = board_size * board_size
        @board = Board.new(board_size, bombs)
        @previous_guess = nil
        @player = player
        @bombs = bombs
        @health = 3
    end

    def display_bombs
        @board.reveal_bombs
        @board.render
        sleep(2)
        @board.hide_bombs
    end

    def over?
        @board.won? || @turns_left == 0 || @health == 0
    end

    def explode
        @board.render
        puts "BOOM"
        @health -= 1
        puts "Health: #{@health}"
        sleep(2)
    end

    def hide_guesses(guessed_pos)
        @board[*guessed_pos].hide
        @board[*@previous_guess].hide
    end

    def turn_fail(guessed_pos, value)
        @board.render
        puts "Try again."
        sleep(2)
        self.hide_guesses(guessed_pos)
        if @player.match?(value)
            @player.receive_match(guessed_pos, @player.get_pos(value))
        else
            @player.receive_card(guessed_pos, value)
        end
    end
    
    def check_guess(guessed_pos)
        value = @board.reveal(guessed_pos)

        if value == '*'
            self.explode
        elsif @previous_guess
            previous_value = @board.reveal(@previous_guess)
            self.turn_fail(guessed_pos, value) unless value == previous_value
            @previous_guess = nil
            @turns_left -= 1
        else
            @previous_guess = guessed_pos
            @player.receive_card(guessed_pos, value)
        end
    end

    def game_over_message
        @board.render
        if @board.won? && @health > 0
            puts "Good job!"
        else
            puts "Game Over"
        end
    end

    def play
        self.display_bombs if @bombs
        until self.over?
            @board.render
            puts "#{@turns_left} turn(s) left."
            @player.prompt
            pos = @player.get_input
            self.check_guess(pos)
        end
        self.game_over_message
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
            puts "start - start a new game"
            puts "normal_mode - set board's width to 4 (default)"
            puts "hard_mode - set board's width to 6"
            puts "bomb_mode - populate the board with bombs, 3 lives"
            puts "player_mode - set human player (default)"
            puts "cpu_mode - set computer player"
            puts "quit - exit program"
        else
            puts "Wrong command, type 'help' if necessary."
        end
    end
end