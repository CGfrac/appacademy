# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.length > 0
        minmax = self.minmax
        minmax[1] - minmax[0]
    else
        return nil
    end
  end
end
