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

def max_tie_breaker(array, tie_breaker, &prc)
    max = nil
    array.each do |ele|
        if (!max || prc.call(ele) > prc.call(max)) || (prc.call(ele) == prc.call(max) && tie_breaker.call(ele) > tie_breaker.call(max))
            max = ele
        end
    end
    max
end

def silly_syllables(sentence)
    silly_sentence = sentence.split.map { |word| silly_slicer(word) }
    silly_sentence.join(" ")
end

def silly_slicer(word)
    vowels = "aeiou"
    first_vowel = nil
    first_index = nil
    last_vowel = nil
    last_index = nil

    word.each_char.with_index do |ch, i|
        if !first_vowel
            first_vowel = ch if vowels.include?(ch)
            first_index = i
        elsif vowels.include?(ch)
            last_vowel = ch 
            last_index = i
        end
    end
    
    return word[first_index..last_index] if first_vowel && last_vowel
    word
end