i = 3
sum = 0
while i < 1000
    sum += i if i % 3 == 0 || i % 5 == 0
    i += 1
end
puts sum
