# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def is_prime?(num)
    (2...num).each { |i| return false if num % i == 0 }
    true
end

