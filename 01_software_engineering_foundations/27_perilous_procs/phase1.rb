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