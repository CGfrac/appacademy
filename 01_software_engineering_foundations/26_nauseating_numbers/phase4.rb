# A "Mersenne prime" is a prime number that is one less than a power of 2. 
# This means that it is a prime number with the form 2^x - 1, where x is some exponent. 
# For example:

#     3 is a Mersenne prime because it is prime and 3 = 2^2 - 1
#     7 is a Mersenne prime because it is prime and 7 = 2^3 - 1
#     11 is not a Mersenne prime because although it is prime, it does not have the form 2^x - 1

# The first three Mersenne primes are 3, 7, and 31.
# Write a method mersenne_prime that accepts a number, n, as an argument and returns the n-th Mersenne prime.

def mersenne_prime(n)
    count = 0
    exponent = 2
    while count < n
        candidate = 2**exponent - 1
        count += 1 if prime?(candidate)
        exponent += 1
    end
    candidate
end

def prime?(num)
    return false if num < 2
    (2..Integer.sqrt(num)).each { |i| return false if num % i == 0 }
    true
end

puts "-----------------------------------"
puts "mersenne_prime"
puts "-----------------------------------"
p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071

# A triangular number is a number of the form (i * (i + 1)) / 2 where i is some positive integer.
# Substituting i with increasing integers gives the triangular number sequence.
# The first five numbers of the triangular number sequence are 1, 3, 6, 10, 15.
# Below is a breakdown of the calculations used to obtain these numbers:

# i	(i * (i + 1)) / 2
# 1	    1
# 2	    3
# 3	    6
# 4	    10
# 5	    15

# We can encode a word as a number by taking the sum of its letters based on their position in the alphabet.
# For example, we can encode "cat" as 24 because c is the 3rd of the alphabet, a is the 1st, and t is the 20th:

# 3 + 1 + 20 = 24

# Write a method triangular_word? that accepts a word as an argument 
# and returns a boolean indicating whether or not that word's number encoding is a triangular number.
# You can assume that the argument contains lowercase letters.

def triangular_word?(word)
    alpha = ("a".."z").to_a
    sum = 0
    word.each_char { |char| sum += (alpha.index(char) + 1) }
    triangular?(sum)
end

def triangular?(num)
    i = 1
    while true
        triangular_number = (i * (i + 1)) / 2
        return true if num == triangular_number
        return false if triangular_number > num
        i += 1
    end
end

puts "-----------------------------------"
puts "triangular_word?"
puts "-----------------------------------"
p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false

# Write a method consecutive_collapse that accepts an array of numbers as an argument.
# The method should return a new array that results from continuously removing consecutive numbers that are adjacent in the array.
# If multiple adjacent pairs are consecutive numbers, remove the leftmost pair first.
# For example:

# [3, 4, 1] -> [1]

#     because 3 and 4 are consecutive and adjacent numbers, so we can remove them

# [1, 4, 3, 7] -> [1, 7]

#     because 4 and 3 are consecutive and adjacent numbers, so we can remove them

# [3, 4, 5] -> [5]

#     because 4 and 3 are consecutive and adjacent numbers, we don't target 4 and 5 since we should prefer to remove the leftmost pair

# We can apply this rule repeatedly until we cannot collapse the array any further:

# # example 1
# [9, 8, 4, 5, 6] -> [4, 5, 6] -> [6]

# # example 2
# [3, 5, 6, 2, 1] -> [3, 2, 1] -> [1]

def consecutive_collapse(arr)
    done = false
    new_arr = arr[0..-1]
    while !done
        done = true
        (0...new_arr.length - 1).each do |i|
            if new_arr[i] == new_arr[i+1] + 1 || new_arr[i] == new_arr[i+1] - 1
                new_arr = new_arr[0...i] + new_arr[i+2..-1]
                done = false
                break
            end
        end
    end
    new_arr
end

puts "-----------------------------------"
puts "consecutive_collapse"
puts "-----------------------------------"
p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []