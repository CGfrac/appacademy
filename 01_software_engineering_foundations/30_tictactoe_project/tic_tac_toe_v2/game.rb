require_relative "board.rb"
require_relative "human_player.rb"

class Game
    def initialize(board_size=3, *player_marks)
        player_marks = [:X, :O] if player_marks.empty?
        @players = player_marks.map { |player_mark| HumanPlayer.new(player_mark) }
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
            @board.place_mark(@current_player.get_position, @current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                puts "Victory"
                @board.print
                return
            end
            self.switch_turn
        end
        puts "Tie"
        @board.print
    end
end