require 'singleton'

class NullPiece < Piece
    include Singleton

    def initialize
        @color = :none
    end

    def moves
    end

    def symbol
        :_
    end
end