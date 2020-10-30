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

# Write a method filter_out that accepts an array and a block as arguments. 
# The method should return a new array where elements of the original array are removed if they return true when given to the block. 
# Solve this using Array#each.

def filter_out(arr, &prc)
    new_arr = []
    arr.each { |ele| new_arr << ele if !prc.call(ele) }
    new_arr
end

puts "-----------------------------------"
puts "filter_out"
puts "-----------------------------------"
p filter_out([10, 6, 3, 2, 5 ]) { |x| x.odd? }      # [10, 6, 2]
p filter_out([1, 7, 3, 5 ]) { |x| x.odd? }          # []
p filter_out([10, 6, 3, 2, 5 ]) { |x| x.even? }     # [3, 5]
p filter_out([1, 7, 3, 5 ]) { |x| x.even? }         # [1, 7, 3, 5]

# Write a method at_least? that accepts an array, a number (n), and a block as an arguments. 
# The method should return a boolean indicating whether or not at least n elements of the array return true when given to the block. 
# Solve this using Array#each.

def at_least?(arr, n, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele) }
    count >= n
end

puts "-----------------------------------"
puts "at_least?"
puts "-----------------------------------"
p at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') }        # false
p at_least?(['sad', 'quickly', 'timid', 'final'], 2) { |s| s.end_with?('ly') }      # false
p at_least?(['sad', 'quickly', 'timidly', 'final'], 2) { |s| s.end_with?('ly') }    # true
p at_least?(['sad', 'quickly', 'timidly', 'finally'], 2) { |s| s.end_with?('ly') }  # true
p at_least?(['sad', 'quickly', 'timid', 'final'], 1) { |s| s.end_with?('ly') }      # true
p at_least?(['sad', 'quick', 'timid', 'final'], 1) { |s| s.end_with?('ly') }        # false
p at_least?([false, false, false], 3) { |bool| bool }                               # false
p at_least?([false, true, true], 3) { |bool| bool }                                 # false
p at_least?([true, true, true], 3) { |bool| bool }                                  # true
p at_least?([true, true, true, true], 3) { |bool| bool }                            # true

# Write a method every? that accepts an array and a block as arguments. 
# The method should return a boolean indicating whether or not all elements of the array return true when given to the block. 
# Solve this using Array#each.

def every?(arr, &prc)
    arr.each { |ele| return false if !prc.call(ele) }
    true
end

puts "-----------------------------------"
puts "every?"
puts "-----------------------------------"
p every?([3, 1, 11, 5]) { |n| n.even? }                                 # false
p every?([2, 4, 4, 8]) { |n| n.even? }                                  # true
p every?([8, 2]) { |n| n.even? }                                        # true
p every?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }  # false
p every?(['squash', 'pea', 'kale', 'potato']) { |str| str[0] == 'p' }   # false
p every?(['parsnip', 'potato', 'pea']) { |str| str[0] == 'p' }          # true