require "colorize"
require_relative "board.rb"

class Tile
    DELTA = [
        [-1, -1], [-1,  0], [-1,  1], [ 0,  1],
        [ 1,  1], [ 1,  0], [ 1, -1], [ 0, -1]
    ]

    attr_reader :bombed, :revealed, :flagged

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
        @neighbors ||= self.neighbors
        @neighbors.count { |neighbor| neighbor.bombed }
    end

    def reveal_neighbors
        @neighbors.each do |neighbor|
            neighbor.reveal unless neighbor.revealed
        end
    end

    def reveal
        @revealed = true
        @neighbor_bombs = self.neighbor_bomb_count
        self.reveal_neighbors if @neighbor_bombs == 0
    end

    def switch_flag
        @flagged = @flagged ? false : true
    end

    def tile_color
        case @neighbor_bombs
        when 1
            :green
        when 2
            :yellow
        when 3
            :light_red
        else
            :red
        end
    end

    def to_s(bombs)
        if self.revealed
            if @neighbor_bombs == 0
                '_'.ljust(2)
            else
                color = self.tile_color
                @neighbor_bombs.to_s.ljust(2).colorize(color)
            end
        elsif @bombed && bombs
            'B'.ljust(2).colorize(:white)
        elsif @flagged
            "F".ljust(2).colorize(:blue)
        else
            "*".ljust(2)
        end
    end
end