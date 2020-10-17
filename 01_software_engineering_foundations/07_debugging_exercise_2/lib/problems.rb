# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def is_prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0 }
end

def largest_prime_factor(num)
    num.downto(2) { |i| return i if num % i == 0 && is_prime?(i) }
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
    indices = Hash.new { |h, k| h[k] = [] }

    arr.each.with_index { |ele, i| indices[ele] << i }

    indices.select { |ele, arr| arr.length > 1 }
end

def count_ele(arr)
    counter = Hash.new(0)
    arr.each { |ele| counter[ele] += 1}
    counter
end

def ana_array(arr_1, arr_2)
    count_ele(arr_1) == count_ele(arr_2)
end