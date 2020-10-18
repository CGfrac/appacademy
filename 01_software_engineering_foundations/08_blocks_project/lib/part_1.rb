VOWELS = "aeiou"

def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] < 3}
end

def count_positive_subarrays(arr)
    arr.count { |sub_arr| sub_arr.sum > 0 }
end

def aba_translate(str)
    translation = ""
    str.each_char.with_index do |char, i|
        translation += char
        translation += ("b" + char) if VOWELS.include?(char)
    end
    translation
end

def aba_array(arr)
    arr.map { |word| aba_translate(word) }
end