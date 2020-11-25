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

a = 999
while a >= 100
    b = 999
    while b >= a
        product = a * b
        break if product <= largest_palindrome
        largest_palindrome = [largest_palindrome, product].max if palindrome?(product)
        b -= 1
    end
    a -= 1
end

puts largest_palindrome