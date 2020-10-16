VOWELS = "aeiou"

def partition(arr, n)
    less = []
    greater = []

    arr.each do |num|
        if num < n
            less << num
        else
            greater << num
        end
    end

    [less, greater]
end

def merge(hash_1, hash_2)
    new_hash = {}
    hash_1.each { |k, v| new_hash[k] = v }
    hash_2.each { |k, v| new_hash[k] = v }
    new_hash
end

def censor(sentence, curses)
    censored = sentence.split.map do |word|
        if curses.include?(word.downcase)
            star_vowels(word)
        else
            word
        end
    end
    censored.join(" ")
end

def star_vowels(word)
    word.each_char.with_index { |char, i| word[i] = "*" if VOWELS.include?(char.downcase) }
end

def power_of_two?(n)
    return true if n == 1
    
    i = 2
    while i <= n
        return true if i == n
        i *= 2
    end

    false
end