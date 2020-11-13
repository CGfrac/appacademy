class Node
    attr_reader :coordinates, :g, :f
    attr_accessor :parent, :open, :closed
    
    def initialize(coordinates, target, parent=nil, g=0)
        @parent = parent
        @coordinates = coordinates
        @g = g
        @h = ((target[0] - @coordinates[0]).abs + (target[1] - @coordinates[1]).abs) * 2
        @f = @g + @h
    end

    def g=(value)
        @g = value
        @f = @g + @h
    end
end