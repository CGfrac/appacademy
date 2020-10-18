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