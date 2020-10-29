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

def maximum(arr, &prc)
    max = nil
    arr.each { |ele| max = ele if !max || prc.call(ele) >= prc.call(max) }
    max
end

def my_group_by(arr, &prc)
    groups = Hash.new { |h,k| h[k] = [] }
    arr.each { |ele| groups[prc.call(ele)] << ele }
    groups
end