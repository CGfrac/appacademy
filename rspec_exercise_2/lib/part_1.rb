def partition(arr, n)
    parts = [ [], [] ]
    arr.each do |num|
        if num < n
            parts[0] << num
        else
            parts[1] << num
        end
    end
    parts
end