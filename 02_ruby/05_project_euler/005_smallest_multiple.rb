MAX_FACTOR = 20

product = 1

def prime?(n)
    return false if n <= 1
    (2..Integer.sqrt(n)).each { |i| return false if n % i == 0 }
    true
end

(1..MAX_FACTOR).each do |factor|
    if prime?(factor)
        exponent = (Math.log(MAX_FACTOR) / Math.log(factor)).floor
        product *= (factor ** exponent)
    end
end

puts product