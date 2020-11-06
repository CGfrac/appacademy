class Item
    attr_accessor :title, :description
    attr_reader :deadline, :done

    # Should use something more robust like Date but that's part of the assignment
    def self.valid_date?(date_string)
        elements = date_string.split('-')
        return false if elements.length != 3
        year, month, day = elements
        return false if year.length != 4 || month.length != 2 || day.length != 2
        return false if month.to_i < 1 || month.to_i > 12 || day.to_i < 1 || day.to_i > 31
        true
    end

    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise "invalid date"
        end
        @description = description
        @done = false
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "invalid date"
        end
    end

    def toggle
        @done = @done ? false : true   
    end
end