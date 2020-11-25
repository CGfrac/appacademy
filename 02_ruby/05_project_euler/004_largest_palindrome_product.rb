max = 0

def palindrome?(num)
    reverse = 0
    helper = num
    while helper > 0
        reverse *= 10
        reverse += helper % 10
        helper /= 10
    end
    num == reverse
end

(100..999).each do |a|
    (a..999).each do |b|
        product = a * b
        max = [max, product].max if palindrome?(product)
    end
end

puts max