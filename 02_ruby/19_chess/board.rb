require_relative "piece"

class Board
    def initialize
        @board = Array.new(8) { Array.new(8, nil) }
        populate_board
    end

    def populate_board
        (0...2).each do |i| 
            (0...@board[0].length).each { |j| @board[i][j] = Piece }
        end
    end
end