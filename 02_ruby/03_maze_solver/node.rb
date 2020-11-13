class Node
    attr_reader :g, :f
    
    def initialize(coordinates, parent=nil, g=0, target)
        @parent = parent
        @coordinates = coordinates
        @g = g
        @h = (target[0] - @coordinates[0]).abs + (target[1] - @coordinates[1]).abs) * 2
        @f = @g + @h
    end

    def @g=(value)
        @g = value
        @f = @g + @h
    end
end