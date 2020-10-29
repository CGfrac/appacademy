# Write a method strange_sums that accepts an array of numbers as an argument.
# The method should return a count of the number of distinct pairs of elements that have a sum of zero. 
# You may assume that the input array contains unique elements.

def strange_sums(arr)
    count = 0
    (0...arr.length - 1).each do |i|
        (i...arr.length).each do |j|
            count += 1 if arr[i] + arr[j] == 0
        end
    end
    count
end

puts "-----------------------------------"
puts "strange_sums"
puts "-----------------------------------"
p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0