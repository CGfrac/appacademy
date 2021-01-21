require_relative "stepable"

class Knight < Piece
    include Stepable

    def symbol
        :H
    end

    def move_diffs
        x, y = @pos
        [
            [x - 2, y - 1], [x - 2, y + 1],
            [x - 1, y - 2], [x - 1, y + 2],
            [x + 1, y - 2], [x + 1, y + 2],
            [x + 2, y - 1], [x + 2, y + 1]
        ]
    end
end