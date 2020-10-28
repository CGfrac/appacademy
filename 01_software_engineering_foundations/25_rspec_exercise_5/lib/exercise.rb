def zip(*arrs)
    arrs.transpose
end

def prizz_proc(arr, prc_1, prc_2)
    arr.select { |ele| (prc_1.call(ele) && !prc_2.call(ele)) || (!prc_1.call(ele) && prc_2.call(ele)) }
end