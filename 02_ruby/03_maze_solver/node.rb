class Node
    attr_reader :g, :f
    
    def initialize(coordinates, parent=nil, g=0, h=0)
        @parent = parent
        @coordinates = coordinates
        @g = g
        @h = h
        @f = @g + @h
    end

    def @g=(value)
        @g = value
        @f = @g + @h
    end
end