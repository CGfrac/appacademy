class Node
    attr_reader :f
    
    def initialize(parent, coordinates, g, h)
        @parent = parent
        @coordinates = coordinates
        @g = g
        @h = h
        @f = @g + @h
    end
end