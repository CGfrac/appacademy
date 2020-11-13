class Node
    attr_reader :f
    
    def initialize(coordinates, parent=nil, g=0, h=0)
        @parent = parent
        @coordinates = coordinates
        @g = g
        @h = h
        @f = @g + @h
    end
end