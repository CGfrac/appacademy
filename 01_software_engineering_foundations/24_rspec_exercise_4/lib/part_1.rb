def my_reject(arr, &prc)
    arr.select { |ele| !prc.call(ele) }
end

def my_one?(arr, &prc)
    return arr.count { |ele| prc.call(ele) } == 1
end