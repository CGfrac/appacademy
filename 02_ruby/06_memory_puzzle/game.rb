require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
    def initialize(player, board_size, match_num=2, bombs=false)
        @board = Board.new(*board_size, match_num, bombs)
        @previous_guesses = []
        @player = player
        @match_num = match_num
        @bombs = bombs
        @turns_left = board_size[0] * board_size[1]
        @health = 3
    end

    def display_bombs
        @board.reveal_bombs
        @board.render
        sleep(2)
        @board.hide_bombs
        @player.eliminate_bomb_coords(@board)
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
        @previous_guesses.each { |guess| @board[*guess].hide }
    end

    def turn_fail(guessed_pos, value)
        @board.render
        puts "Try again."
        sleep(2)
        self.hide_guesses(guessed_pos)
        if @player.matches?(value)
            @player.receive_matches(guessed_pos, value)
        else
            @player.receive_card(guessed_pos, value)
        end
        self.end_turn
    end

    def update_turn(guessed_pos, value)
        @previous_guesses << guessed_pos
        @player.receive_card(guessed_pos, value)
    end

    def end_turn
        @previous_guesses = []
        @turns_left -= 1
    end
    
    def check_guess(guessed_pos)
        value = @board.reveal(guessed_pos)

        if value == '*'
            self.explode
        elsif @previous_guesses.length > 0
            previous_value = @board.reveal(@previous_guesses[-1])
            if value != previous_value
                self.turn_fail(guessed_pos, value)
            elsif @previous_guesses.length + 1 == @match_num
                self.end_turn
            else
                self.update_turn(guessed_pos, value)
            end
        else
            self.update_turn(guessed_pos, value)
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
    board_size = [4,4]
    match_num = 2
    bombs = false
    while true
        puts "Welcome to the memory puzzle! Type 'help' to list available commands."
        cmd = gets.chomp
        case cmd
        when "start"
            game = Game.new(player.new(board_size), board_size, match_num, bombs)
            game.play
        when "normal_mode"
            case match_num
            when 2
                board_size = [4,4]
            when 3
                board_size = [3, 6]
            when 4
                board_size = [4, 6]
            end
        when "hard_mode"
            case match_num
            when 2
                board_size = [6,6]
            when 3
                board_size = [6, 8]
            when 4
                board_size = [6, 8]
            end
        when "match_2"
            board_size = [4,4]
            match_num = 2
        when "match_3"
            board_size = [3, 6]
            match_num = 3
        when "match_4"
            board_size = [4, 6]
            match_num = 4
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
            puts "normal_mode - set board's size to default"
            puts "hard_mode - set bigger board size"
            puts "match_3 - Match 3 board"
            puts "bomb_mode - populate the board with bombs, 3 lives"
            puts "player_mode - set human player (default)"
            puts "cpu_mode - set computer player"
            puts "quit - exit program"
        else
            puts "Wrong command, type 'help' if necessary."
        end
    end
end