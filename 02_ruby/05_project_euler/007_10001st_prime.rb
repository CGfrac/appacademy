counter = 1
n = 3

def prime?(n)
    (3..Integer.sqrt(n)).all? { |i| n % i != 0 }
end

until counter == 10001
    counter += 1 if prime?(n)
    n += 2
end

puts n - 2
