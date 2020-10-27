# Write a method multiply(a, b) that takes in two numbers and returns their product.

#     You must solve this recursively (no loops!)
#     You must not use the multiplication (*) operator

def multiply(a, b)
    return a if b == 1
    if a < 0 && b < 0
        a = a.abs
        b = b.abs
    elsif b < 0
        a = -a
        b = b.abs
    end
    a + multiply(a, b - 1)
end

puts "---------------------------------"
puts "multiply"
puts "---------------------------------"
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18
puts "---------------------------------"

# The Lucas Sequence is a sequence of numbers. 
# The first number of the sequence is 2. 
# The second number of the Lucas Sequence is 1. 
# To generate the next number of the sequence, we add up the previous two numbers.
# For example, the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...
# 
# Write a method lucasSequence that accepts a number representing a length as an arg.
# The method should return an array containing the Lucas Sequence up to the given length. 
# Solve this recursively.

def lucas_sequence(n)
    return [] if n == 0
    return [2] if n == 1
    sequence = lucas_sequence(n - 1)
    return sequence + [1] if n == 2
    sequence << sequence[-2] + sequence[-1]
end

puts "lucas_sequence"
puts "---------------------------------"
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
puts "---------------------------------"