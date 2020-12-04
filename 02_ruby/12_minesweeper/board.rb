require "set"
require_relative "tile.rb"

class Board
    def initialize
        @grid = Array.new(9) { Array.new(9) }
        populate_grid
    end

    def set_bomb_coords
        bombs = Set.new
        while bombs.length < 12
            bombs << [rand(0...@grid.length), rand(0...@grid.length)]
        end
        bombs
    end

    def populate_grid
        bombs = set_bomb_coords
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                bombed = bombs.include?([row,col])
                @grid[row][col] = Tile.new(self, [row, col], bombed)
            end
        end
    end
end