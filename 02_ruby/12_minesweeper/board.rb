require "set"
require_relative "tile.rb"

class Board
    def initialize
        @grid = Array.new(9) { Array.new(9) }
        @bombs = set_bomb_coords
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
            bombs << [rand(0...self.height), rand(0...self.width)]
        end
        bombs
    end

    def populate_grid
        (0...self.height).each do |row|
            (0...self.width).each do |col|
                bombed = @bombs.include?([row,col])
                @grid[row][col] = Tile.new(self, [row, col], bombed)
            end
        end
    end

    def remaining_tiles
        @grid.inject(0) do |count, row|
            count += row.count { |tile| !(tile.revealed || tile.bombed) }
        end
    end

    def render(bombs=false)
        system('clear')
        print " ".ljust(2)
        (0...self.width).each { |index| print index.to_s.ljust(2) }
        puts
        @grid.each_with_index do |row, index|
            print index.to_s.ljust(2)
            row.each { |tile| print tile.to_s(bombs).ljust(2) }
            puts
        end
    end

    def boom
        self.render(true)
        puts "BOOOOOOOM"
    end
end