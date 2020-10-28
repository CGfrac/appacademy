def proper_factors(num)
    (1...num).select { |i| num % i == 0 }
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    i = 1
    arr = []
    while arr.length < n
        arr << i if perfect_number?(i)
        i += 1
    end
    arr
end