require_relative "slideable"

class Bishop < Piece
    include Slideable

    def symbol
        :B
    end

    private
    def move_dirs
        self.diagonal_dirs
    end
end