# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.length > 0
            minmax = self.minmax
            return minmax[1] - minmax[0]
        else
            return nil
        end
    end

    def average
        if self.length > 0
            return self.sum / (self.length * 1.0)
        else
            return nil
        end
    end

    def median
        return nil if self.length == 0

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

    def my_count(value)
        count = 0
        self.each { |ele| count += 1 if ele == value }
        count
    end

    def my_index(value)
        self.each.with_index { |ele, idx| return idx if ele == value }
        nil
    end

    def my_uniq
        visited = Hash.new(false)
        self.select do |ele|
            if !visited[ele]
                visited[ele] = true
                ele
            end
        end
    end

    def my_transpose
        new_arr = Array.new(self.length) { Array.new(self[0].length) }
        self.each.with_index do |row, i|
            row.each_with_index do |column, j|
                new_arr[j][i] = self[i][j]
            end
        end
        new_arr
    end
end
