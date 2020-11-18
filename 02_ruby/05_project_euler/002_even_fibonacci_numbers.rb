LIMIT = 4000000

a = 1
b = 1
sum = 0

while b < LIMIT
    sum += b if b.even?
    tmp = a
    a = b
    b = tmp + b
end

puts sum