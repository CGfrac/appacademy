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

    def valid?(segment)
        counter = Hash.new(0)
        segment.each { |tile| counter[tile.to_s] += 1 }
        counter.values.all? { |value| value == 1 }
    end

    def valid_rows?
        @grid.each { |row| return false unless valid?(row) }
        true
    end

    def valid_columns?
        (0...@grid.length).each do |col|
            column = @grid.map { |row| row[col] }
            return false unless valid?(column)
        end
        true
    end

    def check_square(square)
    end

    def valid_squares?
    end

    def solved?
        valid_rows? && valid_columns?
    end
end