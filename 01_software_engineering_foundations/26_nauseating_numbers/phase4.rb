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

# Write a method pretentious_primes that takes accepts an array and a number, n, as arguments. 
# The method should return a new array where each element of the original array is replaced according to the following rules:

#     when the number argument is positive, replace an element with the n-th nearest prime number that is greater than the element
#     when the number argument is negative, replace an element with the n-th nearest prime number that is less than the element

# For example:

#     if element = 7 and n = 1, then the new element should be 11 because 11 is the nearest prime greater than 7
#     if the element = 7 and n = 2, then the new element should be 13 because 13 is the 2nd nearest prime greater than 7
#     if the element = 7 and n = -1, then the new element should be 5 because 5 is the nearest prime less than 7
#     if the element = 7 and n = -2, then the new element should be 3 because 3 is the 2nd nearest prime less than 7

# Note that we will always be able to find a prime that is greater than a given number 
# because there are an infinite number of primes (this is given by Euclid's Theorem). 
# However, we may be unable to find a prime that is smaller than a given number, because 2 is the smallest prime.
# When a smaller prime cannot be calculated, replace the element with nil.

def pretentious_primes(arr, n)
    arr.map { |num| num = prime_generator(num, n) }
end

def prime_generator(num, n)
    counter = 0
    if n > 0
        while counter < n
            num += 1
            counter += 1 if prime?(num)
        end
    else
        n = n.abs
        while counter < n
            num -= 1
            return nil if num < 2
            counter += 1 if prime?(num)
        end
    end
    num
end

puts "-----------------------------------"
puts "pretentious_primes"
puts "-----------------------------------"
p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]