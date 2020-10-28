def is_prime?(num)
    return false if num < 2
    (2...num).each { |i| return false if num % i == 0 }
    true
end

def nth_prime(n)
    return 2 if n == 1
    i = 3
    counter = 2
    while counter < n
        i += 2
        counter += 1 if is_prime?(i)
    end
    i
end