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

# Write my_zip to take any number of arguments. 
# It should return a new array containing self.length elements. 
# Each element of the new array should be an array with a length of the input arguments + 1 
# and contain the merged elements at that index. 
# If the size of any argument is less than self, nil is returned for that location.

class Array
    def my_zip(*elements)
        zip = Array.new(self.length) { Array.new(elements.length + 1, nil) }
        (0...zip.length).each do |i|
            zip[i][0] = self[i]
            (0...elements.length).each { |j| zip[i][j + 1] = elements[j][i] }
        end
        zip
    end
end

puts "-----------------------------------"
puts "my_zip"
puts "-----------------------------------"
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# Write a method my_rotate that returns a new array containing all the elements of the original array in a rotated order. 
# By default, the array should rotate by one element. 
# If a negative value is given, the array is rotated in the opposite direction.

class Array
    def my_rotate(direction=1)
        rotated = self[0..-1]
        if direction > 0
            direction.times { rotated = rotated[1..-1] + [rotated[0]] }
        else
            direction.abs.times { rotated = [rotated[-1]] + rotated[0...-1] }
        end
        rotated
    end
end

puts "-----------------------------------"
puts "my_rotate"
puts "-----------------------------------"
a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]