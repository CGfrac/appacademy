require_relative "slideable"

class Rook < Piece
    include Slideable

    def symbol
        :R
    end

    private
    def move_dirs
        self.horizontal_dirs
    end
end