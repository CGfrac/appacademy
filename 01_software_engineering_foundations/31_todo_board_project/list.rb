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
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true
    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        hr = "-" * 40
        puts hr
        puts @label.upcase.rjust(20).ljust(20)
        puts hr
        puts "Index".ljust(6) + "| Item".ljust(20) + "| Deadline"
        puts hr
        @items.each_with_index do |item, idx|
            puts "#{idx}".ljust(6) + "| #{item.title}".ljust(20) + "| #{item.deadline}"
        end
        puts hr
    end

    def print_full_item(index)
        if self.valid_index?(index)
            item = self[index]
            hr = "-" * 40
            puts hr
            puts item.title.ljust(20) + item.deadline.rjust(20)
            puts item.description
            puts hr
        end
    end
end