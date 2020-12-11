require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    @board.rows.each_with_index do |row, i|
      (0...row.length).each do |j|
        if @board[i,j].empty?
          board_duplicate = @board.dup
          board_duplicate[i,j] = @next_mover_mark
          next_mark = @next_mover_mark == :o ? :x : :o
          children << TicTacToeNode.new(board_duplicate, next_mark, [i, j])
        end
      end
    end
    children
  end
end
