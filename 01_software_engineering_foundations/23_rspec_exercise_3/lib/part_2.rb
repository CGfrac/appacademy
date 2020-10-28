def element_count(arr)
    counter = Hash.new(0)
    arr.each { |ele| counter[ele] += 1 }
    counter
end