module Stepable
    def moves
        moves = []
        self.move_diffs.each do |pos|
            moves << pos if @board[*pos].color != @color
        end
        moves
    end

    private
    def move_diffs
    end
end