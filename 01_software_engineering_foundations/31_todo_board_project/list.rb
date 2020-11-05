require_relative "item.rb"

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0 || index >= self.size
        true
    end
    
    def swap_index(index_1, index_2)
        return false if !(valid_index?(index_1) && valid_index?(index_2))
        @list[index_1], @list[index_2] = @list[index_2], @list[index_1]
        true
    end

    def [](index)
        return nil if !valid_index(index)
        @items[index]
    end
end