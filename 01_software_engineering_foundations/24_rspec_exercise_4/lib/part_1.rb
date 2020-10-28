def my_reject(arr, &prc)
    arr.select { |ele| !prc.call(ele) }
end

def my_one?(arr, &prc)
    return arr.count { |ele| prc.call(ele) } == 1
end

def hash_select(hash, &prc)
    new_hash = {}
    hash.each { |k, v| new_hash[k] = v if prc.call(k, v) }
    new_hash
end

def xor_select(arr, prc_1, prc_2)
    arr.select { |ele| (prc_1.call(ele) && !prc_2.call(ele)) || (!prc_1.call(ele) && prc_2.call(ele)) }
end

def proc_count(val, procs)
    procs.count { |prc| prc.call(val) }
end