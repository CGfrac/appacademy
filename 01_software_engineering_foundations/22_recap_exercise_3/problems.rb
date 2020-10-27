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

# Write a method longest_streak(str) that accepts a string as an arg.
# The method should return the longest streak of consecutive characters in the string. 
# If there are any ties, return the streak that occurs later in the string.

def longest_streak(str)
    longest = ""
    streak = ""
    str.each_char do |char|
        if char == streak[0]
            streak << char
        else
            streak = char
        end
        longest = streak if streak.length >= longest.length
    end
    longest
end

puts "longest_streak"
puts "---------------------------------"
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'
puts "---------------------------------"

# Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating whether or not the number is a bi-prime.
# A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

# For Example:

#     14 is a bi-prime because 2 * 7
#     22 is a bi-prime because 2 * 11
#     25 is a bi-prime because 5 * 5
#     24 is not a bi-prime because no two prime numbers have a product of 24

def bi_prime?(num)
    i = 2
    while i < (num / 2)
        return prime?(num / i) if prime?(i) && num % i == 0
        i += 1
    end
    false
end

def prime?(num)
    return false if num < 2
    (2..Integer.sqrt(num)).each { |i| return false if num % i == 0 }
    true
end

puts "bi_prime?"
puts "---------------------------------"
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false
puts "---------------------------------"