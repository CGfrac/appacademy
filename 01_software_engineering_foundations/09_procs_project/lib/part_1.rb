def my_map(arr, &prc)
    new_arr = []

    arr.each { |ele| new_arr << prc.call(ele) }

    new_arr
end

def my_select(arr, &prc)
    new_arr = []

    arr.each { |ele| new_arr << ele if prc.call(ele) }

    new_arr
end

def my_count(arr, &prc)
    count = 0

    arr.each { |ele| count += 1 if prc.call(ele) }

    count
end