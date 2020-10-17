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