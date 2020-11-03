class Board
    def initialize
        @grid = Array.new(3) { Array.new(3, '_') }
    end

    def valid?(position)
        position.all? { |coord| coord >= 0 && coord < @grid.length }
    end
end