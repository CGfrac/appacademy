require_relative "tile.rb"

class Board
    def self.from_file(path)
        file = File.open(path)
        lines = file.readlines.map(&:chomp)
        grid = []
        lines.each do |line|
            row = []
            line.split("").each do |value|
                if value.to_i == 0
                    row << Tile.new(' ', false)
                else
                    row << Tile.new(value, true)
                end
            end
            grid << row
        end
        grid
    end

    def initialize(grid)
        @grid = grid
    end

    def [](row, col)
        @grid[row][col]
    end

    def get_tile(pos)
        self[*pos]
    end

    def update_tile(pos, value)
        tile = self.get_tile(pos)
        tile.value = value unless tile.given
    end

    def render
        @grid.each_with_index do |row, r_index|
            puts if r_index % 3 == 0
            row.each_with_index do |tile, t_index|
                print ' ' if t_index % 3 == 0
                print " #{tile.to_s} "
            end
            puts
            puts
        end
    end

    def valid_rows?
        counter = Hash.new(0)
        @grid.each do |row|
            row.each { |tile| counter[tile.to_s] += 1 }
        end
        counter.values.all? { |value| value == 1 }
    end

    def solved?
        valid_rows?
    end
end