require_relative "piece"

class Board
    def initialize
        @grid = Array.new(8) { Array.new(8, nil) }
        populate_board
    end

    def [](*pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, val)
        self[pos] = val
    end

    def populate_board
        (0...2).each do |i| 
            (0...self[0].length).each { |j| self[i, j] = Piece }
        end
        (self.length-2...self.length).each do |i|
            (0...self[0].length).each { |j| self[i, j] = Piece }
        end
    end

    def move_piece(color, start_pos, end_pos)
        raise ArgumentError.new "Invalid start position" if self[start_pos] == nil
        raise ArgumentError.new "Invalid end position" if self[end_pos] == Piece

        self[end_pos], self[start_pos] = self[start_pos], nil
    end

    def valid_pos?(pos)
    end

    def add_piece(piece, pos)
    end

    def checkmate?(color)
    end

    def in_check?(color)
    end

    def find_king(color)
    end

    def pieces
    end

    def dup
    end

    def move_piece!(color, start_pos, end_pos)
    end
end