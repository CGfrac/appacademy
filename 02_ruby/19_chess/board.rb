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
        (@board.length-2...@board.length).each do |i|
            (0...@board[0].length).each { |j| @board[i][j] = Piece }
        end
    end

    def move_piece(start_pos, end_pos)
        start_x, start_y = start_pos
        end_x, end_y = end_pos

        raise ArgumentError.new "Invalid start position" if @board[start_x][start_y] == nil
        raise ArgumentError.new "Invalid end position" if @board[end_x][end_y] == Piece

        @board[end_x][end_y], @board[start_x][start_y] = @board[start_x][start_y], nil
    end
end