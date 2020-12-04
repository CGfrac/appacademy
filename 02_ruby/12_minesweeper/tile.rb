require_relative "board.rb"

class Tile
    def initialize(board, coord, bombed)
        @board = board
        @coord = coord
        @bombed = bombed
        @flagged = false
        @revealed = false
    end
end