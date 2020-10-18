def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    new_str = str.split.map { |word| prc.call(word) }
    new_str.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    num_1 = prc_1.call(num)
    num_2 = prc_2.call(num)
    if num_1 > num_2
        return num_1
    else
        return num_2
    end
end

def and_selector(arr, prc_1, prc_2)
    new_arr = []

    arr.each { |ele| new_arr << ele if prc_1.call(ele) && prc_2.call(ele) }

    new_arr
end