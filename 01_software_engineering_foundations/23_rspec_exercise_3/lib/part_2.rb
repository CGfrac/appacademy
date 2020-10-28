def element_count(arr)
    counter = Hash.new(0)
    arr.each { |ele| counter[ele] += 1 }
    counter
end

def char_replace!(str, hash)
    str.each_char.with_index { |ch, i| str[i] = hash[ch] if hash.has_key?(ch) }
    str
end

def product_inject(arr)
    arr.inject { |product, num| product *= num}
end