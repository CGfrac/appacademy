number = 600851475143
n = 3

def is_prime?(n)
    (3..Integer.sqrt(n)).each { |i| return false if n % i == 0 }
    true
end

while true
    break if n == number
    number /= n if number % n == 0 && is_prime?(n)
    n += 2
end

puts n