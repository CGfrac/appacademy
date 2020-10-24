require_relative "board"
require_relative "player"

class Battleship
    attr_reader :player, :board
    
    def initialize(n)
        @player = Player.new()
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end
end
