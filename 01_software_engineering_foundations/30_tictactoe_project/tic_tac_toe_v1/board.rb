class Board
    def initialize
        @grid = Array.new(3) { Array.new(3, '_') }
    end

    def valid?(position)
        position.all? { |coord| coord >= 0 && coord < @grid.length }
    end

    def empty?(position)
        x, y = position
        @grid[x][y] == '_'
    end

    def place_mark(position, mark)
        if self.valid?(position) && self.empty?(position)
            x, y = position
            @grid[x][y] = mark
        else
            raise "Invalid position!"
        end
    end
end