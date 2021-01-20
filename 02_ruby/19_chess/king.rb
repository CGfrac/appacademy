require_relative "stepable"

class King < Piece
    include Stepable

    def symbol
        :K
    end

    def move_diffs
        x, y = @pos
        [
            [x - 1, y - 1], [x - 1, y], [x - 1, y + 1],
            [x, y - 1], [x, y + 1],
            [x + 1, y - 1], [x + 1, y], [x + 1, y + 1]
        ]
    end
end