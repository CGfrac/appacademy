# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def is_prime?(num)
    return false if num < 2
    (2...num).each { |i| return false if num % i == 0 }
    true
end

def divisors(num)
    factors = []
    i = 2
    while i <= num
        if num % i == 0
            factors << i
        end
        i += 1
    end
    factors
end

def largest_prime_factor(num)
    candidates = divisors(num)
    i = candidates.length - 1
    while i >= 0 
        n = candidates[i]
        return n if is_prime?(n)
        i -= 1
    end
    1
end

def unique_chars?(str)
    counter = Hash.new(0)
    str.each_char do |char|
        return false if counter[char] == 1
        counter[char] = 1
    end
    true
end

def dupe_indices(arr)
    indices = Hash.new([])
    arr.each.with_index { |ele, i| indices[ele] += [i] }
    indices.select! { |k, v| v.length > 1 }
end

def counter(arr)
    counter = Hash.new(0)
    arr.each { |ele| counter[ele] += 1}
    counter
end

def ana_array(arr_1, arr_2)
    count_1 = Hash.new(0)
end