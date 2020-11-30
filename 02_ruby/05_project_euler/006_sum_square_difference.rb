sum = 0
sum_squares = 0

(1..100).each do |i|
    sum += i
    sum_squares += i*i
end

puts (sum * sum) - sum_squares