# Extend the Array class to include a method named my_each that takes a block, 
# calls the block on every element of the array, and returns the original array. 
# Do not use Enumerable's each method.

class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end
end

puts "-----------------------------------"
puts "my_each"
puts "-----------------------------------"
return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end
# => 1
#    2
#    3
#    1
#    2
#    3

p return_value  # => [1, 2, 3]

# Now extend the Array class to include my_select that takes a block and 
# returns a new array containing only elements that satisfy the block. 
# Use your my_each method!

class Array
    def my_select(&prc)
        new_arr = []
        self.my_each { |ele| new_arr << ele if prc.call(ele) }
        new_arr
    end
end

puts "-----------------------------------"
puts "my_select"
puts "-----------------------------------"
a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []