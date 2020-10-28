def my_reject(arr, &prc)
    arr.select { |ele| !prc.call(ele) }
end