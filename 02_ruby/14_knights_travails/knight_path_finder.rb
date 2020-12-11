require "set"
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
        @root_node = PolyTreeNode.new(starting_pos)
        @considered_positions = Set[starting_pos]
        self.build_moves_tree
    end

    def new_move_positions(pos)
        moves = KnightPathFinder.valid_moves(pos)
        moves.select! { |move| !@considered_positions.include?(move) }
        @considered_positions += moves
        moves
    end

    def build_moves_tree
        queue = [@root_node]

        until queue.empty?
            node = queue.shift
            new_move_positions(node.value).each { |pos| node.add_child(PolyTreeNode.new(pos)) }
            queue += node.children
        end
    end

    def trace_path_back(node)
        path = []
        while node
            path.unshift(node.value)
            node = node.parent
        end
        path
    end

    def find_path(end_pos)
        self.trace_path_back(@root_node.dfs(end_pos))
    end
end