require_relative "board.rb"

class Tile
    DELTA = [
        [-1, -1],
        [-1,  0],
        [-1,  1],
        [ 0,  1],
        [ 1,  1],
        [ 1,  0],
        [ 1, -1],
        [ 0, -1]
    ]

    attr_reader :bombed

    def initialize(board, pos, bombed)
        @board = board
        @pos = pos
        @bombed = bombed
        @flagged = false
        @revealed = false
    end

    def inspect
        { pos: @pos, bombed: @bombed, flagged: @flagged, revealed: @revealed }
    end

    def neighbors
        x, y = @pos
        neighbors = []
        DELTA.each do |d_x, d_y|
            n_x = x + d_x
            n_y = y + d_y
            if 0 <= n_x && n_x < @board.height && 0 <= n_y && n_y < @board.width
                neighbors << @board[n_x, n_y]
            end
        end
        neighbors
    end

    def neighbor_bomb_count
        @neighbors ||= neighbors
        @neighbors.count { |neighbor| neighbor.bombed }
    end
end