require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
    def initialize(player, board_size)
        @board = Board.new(board_size)
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

if __FILE__ == $PROGRAM_NAME
    player = HumanPlayer.new
    board_size = 4
    while true
        puts "Welcome to the memory puzzle! Type 'help' to list available commands."
        cmd = gets.chomp
        case cmd
        when "start"
            game = Game.new(player, board_size.to_i)
            game.play
        when "size"
            print "Type a number between 3 and 26: "
            input = gets.chomp.to_i
            if input < 3 || input > 26
                "Out of range, try again."
            else
                board_size = input
            end
        when "player_mode"
            player = HumanPlayer.new
        when "cpu_mode"
            player = ComputerPlayer.new
        when "quit"
            break
        when "help"
            puts "size - set board's width (default: 4)"
            puts "player_mode - set human player (default)"
            puts "cpu_mode - set computer player"
            puts "quit - exit program"
        else
            puts "Wrong command, type 'help' if necessary."
        end
    end
end