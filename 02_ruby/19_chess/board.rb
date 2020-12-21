require_relative "piece"

class Board
    def initialize
        @board = Array.new(8) { Array.new(8, nil) }
        populate_board
    end

    def [](*pos)
        x, y = pos
        @board[x][y]
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

    def move_piece(start_pos, end_pos)
        raise ArgumentError.new "Invalid start position" if self[start_pos] == nil
        raise ArgumentError.new "Invalid end position" if self[end_pos] == Piece

        self[end_pos], self[start_pos] = self[start_pos], nil
    end
end