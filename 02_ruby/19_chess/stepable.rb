module Stepable
    def moves
        moves = []
        self.move_diffs.each do |pos|
            if pos.all? { |coord| coord.between?(0,8) } && @board[*pos].color != @color
                moves << pos
            end
        end
        moves
    end

    private
    def move_diffs
    end
end