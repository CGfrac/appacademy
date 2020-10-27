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

# A Caesar cipher takes a word and encrypts it by offsetting each letter in the word by a fixed number, called the key.
# Given a key of 3, for example: a -> d, p -> s, and y -> b.

# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used.
# For example, if we encrypt "bananasinpajamas" with the key sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt":

# Message:  b a n a n a s i n p a j a m a s
# Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Result:   c c q b p d t k q q c m b o d t

# Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, returning the encrypted message.
# Assume that the message consists of only lowercase alphabetic characters.

def vigenere_cipher(message, keys)
    alphabet = ("a".."z").to_a
    rotation = 0
    cipher = ""

    message.each_char do |char|
        index = (alphabet.index(char) + keys[rotation]) % 26
        cipher += alphabet[index]
        rotation = (rotation + 1) % keys.length
    end

    cipher
end

puts "vigenere_cipher"
puts "---------------------------------"
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"
puts "---------------------------------"

# Write a method vowel_rotate(str) that accepts a string as an arg and returns the string where every vowel is replaced with the vowel the appears
# before it sequentially in the original string.
# The first vowel of the string should be replaced with the last vowel.

def vowel_rotate(str)
    vowels = "aeiou"
    first = nil
    prev = " "
    str.each_char.with_index do |char, idx|
        if vowels.include?(char)
            first ||= idx
            str[idx] = prev
            prev = char
        end
    end
    str[first] = prev
    str
end

puts "vowel_rotate"
puts "---------------------------------"
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"
puts "---------------------------------"