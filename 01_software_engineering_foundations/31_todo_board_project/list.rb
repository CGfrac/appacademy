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
        hr = "-" * 45
        puts hr
        puts @label.upcase.rjust(20).ljust(20)
        puts hr
        puts "Index".ljust(6) + "| Item".ljust(20) + "| Deadline".ljust(12) + "| Done"
        puts hr
        @items.each_with_index do |item, idx|
            if item.done
                checkmark = "[✓]"
            else
                checkmark = "[ ]"
            end
            puts "#{idx}".ljust(6) + "| #{item.title}".ljust(20) + "| #{item.deadline}" + " | #{checkmark}"
        end
        puts hr
    end

    def print_full_item(index)
        if self.valid_index?(index)
            item = self[index]
            hr = "-" * 40
            puts hr
            puts item.title.ljust(20) + item.deadline.rjust(20)
            if item.done
                checkmark = "[✓]"
            else
                checkmark = "[ ]"
            end
            puts item.description.ljust(20) + "Done: #{checkmark}".rjust(20)
            puts hr
        end
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount=1)
        return false if !self.valid_index?(index)
        while index > 0 || amount > 0
            self.swap_index(index, index-1)
            index -= 1
            amount -= 1
        end
        true
    end

    def down(index, amount=1)
        return false if !self.valid_index?(index)
        while index < self.size - 1 || amount > 0
            self.swap_index(index, index+1)
            index += 1
            amount -= 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

    def toggle_item(index)
        self[index].toggle
    end

    def remove_item(index)
        return false if !self.valid_index?(index)
        self.down(index, self.size - index)
        @items.pop
        true
    end

    def purge
        @items.each_with_index { |item, index| self.remove_item(index) if item.done }
    end
end