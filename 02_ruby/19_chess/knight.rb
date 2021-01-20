require_relative "stepable"

class Knight < Piece
    include Stepable

    def symbol
        :H
    end
end