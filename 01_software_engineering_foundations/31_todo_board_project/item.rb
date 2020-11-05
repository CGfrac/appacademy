class Item
    # Should use something more robust like Date but that's part of the assignment
    def self.valid_date?(date_string)
        elements = date_string.split('-')
        return false if elements.length != 3
        year, month, day = elements
        return false if year.length != 4 || month.to_i < 1 || month.to_i > 12 || day.to_i < 1 || day.to_i > 31
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
    end
end