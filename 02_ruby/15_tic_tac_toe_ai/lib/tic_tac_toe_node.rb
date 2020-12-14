require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos, :children

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return @board.winner != evaluator && !@board.tied? if @board.over?
    if evaluator == @next_mover_mark
      self.children.all? { |child| child.losing_node?(evaluator) }
    else
      self.children.any? { |child| child.losing_node?(evaluator) }
    end
  end
  
  def winning_node?(evaluator)
    return @board.winner == evaluator if @board.over?
    if evaluator == @next_mover_mark
      self.children.any? { |child| child.winning_node?(evaluator) }
    else
      self.children.all? { |child| child.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    @children = []
    @board.rows.each_with_index do |row, i|
      (0...row.length).each do |j|
        pos = [i,j]
        if @board.empty?(pos)
          board_duplicate = @board.dup
          board_duplicate[pos] = @next_mover_mark
          next_mark = @next_mover_mark == :o ? :x : :o
          @children << TicTacToeNode.new(board_duplicate, next_mark, pos)
        end
      end
    end
    @children
  end
end
