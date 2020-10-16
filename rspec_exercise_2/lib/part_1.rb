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

def merge(hash_1, hash_2)
    new_hash = {}
    hash_1.each { |k, v| new_hash[k] = v }
    hash_2.each { |k, v| new_hash[k] = v }
    new_hash
end