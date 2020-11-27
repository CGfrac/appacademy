def print_exercise_name(name)
    hr = '-' * 17
    puts hr
    puts name
    puts hr
end

# Write a recursive method, range, that takes a start and an end
# and returns an array of all numbers in that range, exclusive. 
# For example, range(1, 5) should return [1, 2, 3, 4]. 
# If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.

def range_recursive(start, stop)
    return [] if stop - 1 < start
    range_recursive(start, stop - 1) + [stop - 1]
end

def range_iterative(start, stop)
    range = []
    while start < stop
        range << start
        start += 1
    end
    range
end

print_exercise_name("range")
p range_recursive(1,5)
p range_iterative(1,5)

def exponentiation_1(base, exponent)
    return 1 if exponent == 0
    base * exponentiation_1(base, exponent - 1)
end

print_exercise_name("exponentiation_1")
p exponentiation_1(4,0)
p exponentiation_1(2,3)

def exponentiation_2(base, exponent)
    return 1 if exponent == 0
    if exponent.even?
        acc = exponentiation_2(base, exponent / 2)
        acc * acc
    else
        acc = exponentiation_2(base, (exponent - 1) / 2)
        base * acc * acc
    end
end

print_exercise_name("exponentiation_2")
p exponentiation_2(4,0)
p exponentiation_2(2,3)

class Array
    def deep_dup
        deep_copy = []
        self.each do |ele|
            if ele.is_a?(Array)
                deep_copy << ele.deep_dup
            else
                deep_copy << ele
            end
        end
        deep_copy
    end
end

print_exercise_name("deep_dup")
robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]
robot_parts_copy = robot_parts.deep_dup
robot_parts_copy[1] << "LEDs"
p robot_parts_copy[1]
p robot_parts[1] # Should be unchanged

mixed_array = [1, [2], [3, [4]]]
mixed_array_copy = mixed_array.deep_dup
mixed_array_copy[2][1][0] = 5
p mixed_array_copy
p mixed_array # Should be unchanged

# Write a recursive and an iterative Fibonacci method. 
# The method should take in an integer n and return the first n 
# Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; 
# you should be able to do this just passing a single argument 
# for the number of Fibonacci numbers requested.

def fibonacci_recursive(n)
    return [0] if n == 0
    return [0,1] if n == 1
    return [0,1,1] if n == 2
    sequence = fibonacci_recursive(n-1)
    next_value = sequence[-1] + sequence[-2]
    sequence + [next_value]
end

def fibonacci_iterative(n)
    sequence = [0,1]
    return sequence[0..n] if n <= 1
    (2..n).each do
        next_value = sequence[-1] + sequence[-2]
        sequence << next_value
    end
    sequence
end

print_exercise_name("fibonacci")
p fibonacci_recursive(3)
p fibonacci_recursive(16)
p fibonacci_iterative(3)
p fibonacci_iterative(16)