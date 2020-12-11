require "set"
require_relative "lib/00_tree_node.rb"

class KnightPathFinder

    MOVES = [
        [-2,-1], [-2, 1],
        [ 2,-1], [ 2, 1],
        [-1,-2], [ 1,-2],
        [-1, 2], [ 1, 2]
    ]

    def self.valid_moves(pos)
        valid_moves = []
        x, y = pos

        MOVES.each do |move|
            d_x, d_y = move
            new_pos = [x + d_x, y + d_y]
            if new_pos.all? { |coord| coord.between?(0,7) }
                valid_moves << new_pos
            end
        end

        valid_moves
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

if __FILE__ == $PROGRAM_NAME
    kpf = KnightPathFinder.new([0, 0])
    p kpf.find_path([7, 6]) # => 6 steps
    p kpf.find_path([6, 2]) # => 5 steps
end