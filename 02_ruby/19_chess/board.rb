require_relative "piece"
require_relative "rook"
require "byebug"

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
        x, y = pos
        @grid[x][y] = val
    end
    
    def populate_board
        (0..1).each do |i| 
            (0..7).each do |j|
                pos = [i, j]
                if pos == [0, 0] || pos == [0, 7]
                    self.add_piece(Rook, pos)
                else
                    self.add_piece(Piece, pos)
                end
            end
        end
        (6..7).each do |i|
            (0..7).each do |j|
                pos = [i, j]
                if pos == [7, 0] || pos == [7, 7]
                    self.add_piece(Rook, pos)
                else
                    self.add_piece(Piece, pos)
                end
            end
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
        self[pos] = piece
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
        @grid.map { |row| row.dup }
    end

    def move_piece!(color, start_pos, end_pos)
    end
end