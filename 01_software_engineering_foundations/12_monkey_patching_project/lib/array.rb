# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        
        self.max - self.min
    end

    def average
        return nil if self.empty?
        
        self.sum / (self.length * 1.0)
    end

    def median
        return nil if self.empty?

        if self.length.odd?
            return self.sort[self.length / 2]
        else
            middle_right = self.length / 2
            middle_left = middle_right - 1
            sorted = self.sort
            return (sorted[middle_left] + sorted[middle_right]) / 2.0
        end
    end

    def counts
        counter = Hash.new(0)
        self.each { |ele| counter[ele] += 1 }
        counter
    end

    def my_count(target)
        count = 0
        self.each { |ele| count += 1 if ele == target }
        count
    end

    def my_index(target)
        self.each.with_index { |ele, idx| return idx if ele == target }
        nil
    end

    def my_uniq
        hash = {}
        self.each { |ele| hash[ele] = true }
        hash.keys
    end

    def my_transpose
        new_arr = Array.new(self.length) { Array.new(self[0].length) }
        self.each_with_index do |row, i|
            row.each_with_index do |column, j|
                new_arr[j][i] = self[i][j]
            end
        end
        new_arr
    end
end
