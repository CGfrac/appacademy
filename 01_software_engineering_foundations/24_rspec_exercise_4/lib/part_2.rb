def proper_factors(num)
    (1...num).select { |i| num % i == 0 }
end

def aliquot_sum(num)
    proper_factors(num).sum
end