# Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated in the array.

def no_dupes?(arr)
    counter = Hash.new(0)
    arr.each { |ele| counter[ele] += 1 }
    counter.keys.select { |k| counter[k] == 1 }
end

puts "---------------------------------"
puts "no_dupes?"
puts "---------------------------------"
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []
puts "---------------------------------"

# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. 
# The method should return true if an element never appears consecutively in the array; it should return false otherwise.

def no_consecutive_repeats?(arr)
    prev = nil
    arr.each do |ele|
        return false if ele == prev
        prev = ele
    end
    true
end

puts "no_consecutive_repeats?"
puts "---------------------------------"
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true
puts "---------------------------------"

#Write a method char_indices(str) that takes in a string as an arg. The method should return a hash containing characters as keys.
# The value associated with each key should be an array containing the indices where that character is found.

def char_indices(str)
    indices = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index { |char, idx| indices[char] << idx }
    indices
end

puts "char_indices"
puts "---------------------------------"
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
puts "---------------------------------"