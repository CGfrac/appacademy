require_relative "board.rb"
require_relative "human_player.rb"

class Game
    def initialize(board_size=3, player_marks={X: false, O: true})
        @players = []
        player_marks.each do |player_mark, computer|
            if computer
                @players << ComputerPlayer.new(player_mark)
            else
                @players << HumanPlayer.new(player_mark)
            end
        end
        @board = Board.new(board_size)
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            legal_positions = @board.legal_positions
            position = @current_player.get_position(legal_positions)
            @board.place_mark(position, @current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                @board.print
                puts "Victory"
                return
            end
            self.switch_turn
        end
        
        @board.print

        puts "Tie"
    end
end