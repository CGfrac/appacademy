def prime?(n)
    (3..Integer.sqrt(n)).all? { |i| n % i != 0 }
end

counter = 2
k = 1

while true
    candidate = (6 * k) - 1
    counter += 1 if prime?(candidate)
    break if counter == 10001

    candidate = (6 * k) + 1
    counter += 1 if prime?(candidate)
    break if counter == 10001
    
    k += 1
end

puts candidate