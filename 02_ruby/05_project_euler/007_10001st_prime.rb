def prime?(n)
    if n == 1
        false
    elsif n < 4
        true
    elsif n % 2 == 0
        false
    elsif n < 9
        true
    elsif n % 3 == 0
        false
    else
        limit = Integer.sqrt(n)
        factor = 5
        until factor > limit
            return false if n % factor == 0
            return false if n % (factor + 2) == 0
            factor += 6
        end
        true
    end
end

counter = 1
candidate = 1

until counter == 10001
    candidate += 2
    counter += 1 if prime?(candidate)
end

puts candidate