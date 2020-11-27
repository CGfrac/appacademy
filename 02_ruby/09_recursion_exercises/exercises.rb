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