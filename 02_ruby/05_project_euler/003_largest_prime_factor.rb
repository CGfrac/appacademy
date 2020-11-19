n = 600851475143

if n.even?
    last_factor = 2
    n /= 2 while n.even?
else
    last_factor = 1
end

factor = 3
max_factor = Integer.sqrt(n)

while n > 1 && factor <= max_factor
    if n % factor == 0
        last_factor = factor
        n /= factor while n % factor == 0
        max_factor = Integer.sqrt(n)
    end
    factor += 2
end

if n == 1
    puts last_factor
else
    puts n
end

    