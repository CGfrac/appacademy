require_relative "lib/00_tree_node.rb"

class KnightPathFinder
    def initialize(starting_pos)
        @root_node = PolyTreeNode(starting_pos)
    end
end