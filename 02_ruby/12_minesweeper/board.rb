require "set"
require_relative "tile.rb"

class Board
    def initialize
        @grid = Array.new(9) { Array.new(9) }
        populate_grid
    end

    def [](*pos)
        row, col = pos
        @grid[row][col]
    end

    def height
        @grid.length
    end

    def width
        @grid[0].length
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

    def render
        print " ".ljust(2)
        (0...self.width).each { |index| print index.to_s.ljust(2) }
        puts
        @grid.each_with_index do |row, index|
            print index.to_s.ljust(2)
            row.each { |tile| print tile.to_s.ljust(2) }
            puts
        end
    end
end