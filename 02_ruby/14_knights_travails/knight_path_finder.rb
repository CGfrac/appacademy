require_relative "lib/00_tree_node.rb"

class KnightPathFinder

    def self.valid_moves(pos)
        row, col = pos
        moves = []
        if row - 2 >= 0
            moves << [row - 2, col - 1] if col - 1 >= 0
            moves << [row - 2, col + 1] if col + 1 < 8
        end
        if row + 2 < 8
            moves << [row + 2, col - 1] if col - 1 >= 0
            moves << [row + 2, col + 1] if col + 1 < 8
        end
        if col - 2 >= 0
            moves << [row - 1, col - 2] if row - 1 >= 0
            moves << [row + 1, col - 2] if row + 1 < 8
        end
        if col + 2 < 8
            moves << [row - 1, col + 2] if row - 1 >= 0
            moves << [row + 1, col + 2] if row + 1 < 8
        end
        moves
    end

    def initialize(starting_pos)
        @root_node = PolyTreeNode(starting_pos)
        @considered_positions = [starting_pos]
    end
end