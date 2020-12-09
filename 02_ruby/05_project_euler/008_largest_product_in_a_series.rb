file = File.open("008_largest_product_in_a_series.txt")

lines = file.readlines.map(&:chomp)
sequence = []

lines.each do |line| 
    line.split("").each { |digit| sequence << Integer(digit) }
end

largest_product = 0

i = 0
adjacent_digits = 13

while (i + adjacent_digits) <= sequence.length
    product = 1

    (0...adjacent_digits).each do |j|
        if sequence[i+j] == 0
            i += j
            product = 0
            break
        end
        product *= sequence[i+j]
    end

    largest_product = [product, largest_product].max
    i += 1
end

puts largest_product