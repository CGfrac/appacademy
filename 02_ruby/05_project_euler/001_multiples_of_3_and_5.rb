TARGET = 999

def sum_divisible_by(n)
    p = TARGET / n
    return n * (p * (p + 1)) / 2
end

puts sum_divisible_by(3) + sum_divisible_by(5) - sum_divisible_by(15)
