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

# Write a recursive binary search: bsearch(array, target). 
# Note that binary search only works on sorted arrays. 
# Make sure to return the location of the found object (or nil if not found!). 
# Hint: you will probably want to use subarrays.

def bsearch(array, target)
    return nil if array.empty?
    
    middle = array.length / 2

    case array[middle] <=> target
    when -1
        subarray = array[middle+1..-1]
        index = bsearch(subarray, target)
        middle + (1 + index) if index
    when 0
        middle
    when 1
        subarray = array[0...middle]
        bsearch(subarray, target)
    end
end

print_exercise_name("bsearch")
p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
    return array if array.length <= 1

    middle = array.length / 2

    left_arr = merge_sort(array[0...middle])
    right_arr = merge_sort(array[middle..-1])

    merge(left_arr, right_arr)
end

def merge(left_arr, right_arr)
    merged = []
    i, j = 0,0
    while i < left_arr.length && j < right_arr.length
        if left_arr[i] <= right_arr[j]
            merged << left_arr[i]
            i += 1
        else
            merged << right_arr[j]
            j += 1
        end
    end
    while i < left_arr.length
        merged << left_arr[i]
        i += 1
    end
    while j < right_arr.length
        merged << right_arr[j]
        j += 1
    end
    merged
end

print_exercise_name("merge_sort")
arr = [22, 3, 20, 6, 4, 9, 22, 5, 8, 7, 4, 7, 2, 7, 11, 1]
p merge_sort(arr)

def subsets(arr)
    return [[]] if arr.length == 0

    subs = [[arr[-1]]]
    (0...arr.length-1).each { |i| subs << [arr[i]] + [arr[-1]] }
    subs << arr[0..-1] if arr.length > 2

    subsets(arr[0..-2]) + subs
end

print_exercise_name("subsets")
p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(arr)
    return [arr] if arr.length <= 1
    perms = []
    (0...arr.length).each do |i|
        sub_array = arr[0...i] + arr[i+1..-1]
        sub_perms = permutations(sub_array)
        sub_perms.each { |sub_perm| perms << [arr[i]] + sub_perm }
    end
    perms
end

print_exercise_name("permutations")
p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                          #     [2, 1, 3], [2, 3, 1],
                          #     [3, 1, 2], [3, 2, 1]]