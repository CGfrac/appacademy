class PolyTreeNode
    attr_reader :value, :parent
    attr_accessor :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        @parent.children.reject! { |child| child == self } if @parent
        @parent = parent_node
        parent_node.children << self if parent_node
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "Not a child" unless @children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if @value == target_value

        @children.each do |child|
            node = child.dfs(target_value)
            return node if node && node.value == target_value
        end

        nil
    end
end