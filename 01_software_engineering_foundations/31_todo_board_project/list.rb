class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end
end