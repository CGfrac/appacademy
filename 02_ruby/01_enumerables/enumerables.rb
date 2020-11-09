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

# Write my_reject to take a block and return a new array 
# excluding elements that satisfy the block.

class Array
    def my_reject(&prc)
        new_arr = []
        self.my_each { |ele| new_arr << ele if !prc.call(ele) }
        new_arr
    end
end

puts "-----------------------------------"
puts "my_reject"
puts "-----------------------------------"
a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# Write my_any? to return true if any elements of the array satisfy 
# the block and my_all? to return true only if all elements satisfy the block.

class Array
    def my_any?(&prc)
        self.my_each { |ele| return true if prc.call(ele) }
        false
    end

    def my_all?(&prc)
        self.my_each { |ele| return false if !prc.call(ele) }
        true
    end
end

puts "-----------------------------------"
puts "my_any? and my_all?"
puts "-----------------------------------"
a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true

# my_flatten should return all elements of the array into a new, one-dimensional array. 
# Hint: use recursion!

class Array
    def my_flatten
        return [] if self.length == 0
        if self[0].is_a?(Array)
            new_arr = self[0].my_flatten
        else
            new_arr = [self[0]]
        end
        new_arr + self[1..-1].my_flatten
    end
end

puts "-----------------------------------"
puts "my_flatten"
puts "-----------------------------------"
p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]