def zip(*arrs)
    arrs.transpose
end

def prizz_proc(arr, prc_1, prc_2)
    arr.select { |ele| (prc_1.call(ele) && !prc_2.call(ele)) || (!prc_1.call(ele) && prc_2.call(ele)) }
end

require "byebug"

def zany_zip(*arrs)
    length = 0
    arrs.each { |row| length = row.length if row.length > length }
    new_arr = Array.new(length) { Array.new(arrs.length, nil) }
    
    (0...arrs.length).each do |i|
        (0...arrs[i].length).each do |j|
            new_arr[j][i] = arrs[i][j]
        end
    end

    new_arr
end