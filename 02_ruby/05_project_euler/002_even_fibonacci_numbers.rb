LIMIT = 4000000

a = 1
b = 1
c = a + b
sum = 0

while c < LIMIT
    sum += c
    a = b + c
    b = c + a
    c = a + b
end

puts sum