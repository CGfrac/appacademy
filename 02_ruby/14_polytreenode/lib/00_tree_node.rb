class PolyTreeNode
    attr_reader :value, :parent
    attr_accessor :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        @parent.children.reject! { |child| child == self } if @parent
        @parent = node
        node.children << self if node
    end
end