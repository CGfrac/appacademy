# Write a method some? that accepts an array and a block as arguments.
# The method should return a boolean indicating whether or not at least one of the elements of the array returns true when given to the block.
# Solve this using Array#each.

def some?(arr, &prc)
    arr.each { |ele| return true if prc.call(ele) }
    false
end

puts "-----------------------------------"
puts "some?"
puts "-----------------------------------"
p some?([3, 1, 11, 5]) { |n| n.even? }                                # false
p some?([3, 4, 11, 5]) { |n| n.even? }                                # true
p some?([8, 2]) { |n| n.even? }                                       # true
p some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' } # false
p some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' } # true
p some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }        # true

# Write a method exactly? that accepts an array, a number (n), and a block as arguments. 
# The method should return a boolean indicating whether or not there are exactly n elements that return true when given to the block.
# Solve this using Array#each.

def exactly?(arr, n, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele) }
    count == n
end

puts "-----------------------------------"
puts "exactly?"
puts "-----------------------------------"
p exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase }         # true
p exactly?(['A', 'B', 'C'], 2) { |el| el == el.upcase }         # false
p exactly?(['A', 'B', 'C'], 3) { |el| el == el.upcase }         # true
p exactly?(['cat', 'DOG', 'bird'], 1) { |el| el == el.upcase }  # true
p exactly?(['cat', 'DOG', 'bird'], 0) { |el| el == el.upcase }  # false
p exactly?(['cat', 'dog', 'bird'], 0) { |el| el == el.upcase }  # true
p exactly?([4, 5], 3) { |n| n > 0 }                             # false
p exactly?([4, 5, 2], 3) { |n| n > 0 }                          # true
p exactly?([42, -9, 7, -3, -6], 2) { |n| n > 0 }                # true