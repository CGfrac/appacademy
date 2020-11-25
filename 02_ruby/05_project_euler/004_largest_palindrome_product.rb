largest_palindrome = 0

def reverse(num)
    reversed = 0
    while num > 0
        reversed = reversed * 10 + num % 10
        num /= 10
    end
    reversed
end

def palindrome?(num)
    num == reverse(num)
end

(100..999).each do |a|
    (a..999).each do |b|
        product = a * b
        largest_palindrome = [largest_palindrome, product].max if palindrome?(product)
    end
end

puts largest_palindrome