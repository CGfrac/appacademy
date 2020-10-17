# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def is_prime?(num)
    (2...num).each { |i| return false if num % i == 0 }
    true
end

def divisors(num)
    divisors = []
    factor = 2
    while factor < num
        if num % factor == 0
            divisors << factor
            num /= factor
        else
            factor += 1
        end
    end
    divisors
end