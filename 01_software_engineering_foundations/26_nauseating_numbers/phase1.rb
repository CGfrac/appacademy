# Write a method strange_sums that accepts an array of numbers as an argument.
# The method should return a count of the number of distinct pairs of elements that have a sum of zero. 
# You may assume that the input array contains unique elements.

def strange_sums(arr)
    count = 0
    (0...arr.length - 1).each do |i|
        (i+1...arr.length).each do |j|
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

# Write a method pair_product that accepts an array of numbers and a product as arguments.
# The method should return a boolean indicating whether or not a pair of distinct elements in the array result in the product when multiplied together.
# You may assume that the input array contains unique elements.

def pair_product(arr, product)
    (0...arr.length - 1).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] * arr[j] == product
        end
    end
    false
end

puts "-----------------------------------"
puts "pair_product"
puts "-----------------------------------"
p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false

# Write a method rampant_repeats that accepts a string and a hash as arguments.
# The method should return a new string where characters of the original string are repeated the number of times specified by the hash.
# If a character does not exist as a key of the hash, then it should remain unchanged.

def rampant_repeats(str, hash)
    new_str = ""
    str.each_char { |char| new_str << char * (hash[char] || 1) }
    new_str
end

puts "-----------------------------------"
puts "rampant_repeats"
puts "-----------------------------------"
p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'