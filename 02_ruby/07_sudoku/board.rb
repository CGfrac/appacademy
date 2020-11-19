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

    def update_tile(pos, value)
        tile = self[*pos]
        tile.value = value
    end

    def render
        print ' '.ljust(2)
        (0...@grid.length).each do |i|
            print ' ' if i % 3 == 0
            print i.to_s.ljust(3)
        end
        puts

        @grid.each_with_index do |row, r_index|
            puts if r_index % 3 == 0
            print r_index.to_s.ljust(1)
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

    def valid_square?(rows, cols)
        square = @grid[rows].map { |row| row[cols] }
        self.valid?(square.flatten)
    end

    def get_range(factor)
        start = 3 * factor
        finish = start + 3
        start...finish
    end

    def valid_squares?
        (0...2).each do |a|
            (0...2).each do |b|
                rows = self.get_range(a)
                cols = self.get_range(b)
                return false unless self.valid_square?(rows, cols)
            end
        end
        true
    end

    def solved?
        self.valid_rows? && self.valid_columns? && self.valid_squares?
    end
end