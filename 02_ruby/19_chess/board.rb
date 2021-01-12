require_relative "piece"
require_relative "rook"
require_relative "null_piece"

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) { Array.new(8, nil) }
        populate_board
    end

    def [](*pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @rows[x][y] = val
    end
    
    def populate_board
        (0..7).each do |i| 
            (0..7).each do |j|
                case i
                when 0..1
                    color = :black
                when 6..7
                    color = :white
                else
                    piece = NullPiece.instance
                    self.add_piece(piece, [i,j])
                    next
                end
                pos = [i, j]
                if i == 0 || i == 7 and j == 0 || j == 7
                    piece = Rook.new(color, @board, pos)
                else
                    piece = Piece.new(color, @board, pos)
                end
                self.add_piece(piece, pos)
            end
        end
    end

    def move_piece(color, start_pos, end_pos)
        raise ArgumentError.new "Invalid start position" if self[start_pos] == nil
        raise ArgumentError.new "Invalid end position" if self[end_pos] == Piece

        self[end_pos], self[start_pos] = self[start_pos], nil
    end
end