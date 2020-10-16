VOWELS = "aeiou"

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

def censor(sentence, curses)
    censored = sentence.split.map do |word|
        if curses.include?(word.downcase)
            word.each_char.with_index { |char, i| word[i] = "*" if VOWELS.include?(char.downcase) }
        end
        word
    end
    censored.join(" ")
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