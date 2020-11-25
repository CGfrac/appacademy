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

largest_palindrome = 0

a = 999
while a >= 100
    # Either a or b must have a factor of 11
    if a % 11 == 0
        b = 999
        db = 1
    else
        b = 990
        db = 11
    end
    while b >= a
        product = a * b
        break if product <= largest_palindrome
        largest_palindrome = [largest_palindrome, product].max if palindrome?(product)
        b -= db
    end
    a -= 1
end

puts largest_palindrome