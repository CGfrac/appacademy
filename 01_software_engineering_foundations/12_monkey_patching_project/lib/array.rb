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
end
