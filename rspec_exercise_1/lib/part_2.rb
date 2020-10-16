VOWELS = "aeiou"

def hipsterfy(word)
    i = word.length - 1
    while i > 0
        if VOWELS.include?(word[i])
            word[i] = ""
            break
        end
        i -= 1
    end
    word
end

def vowel_counts(str)
    counts = Hash.new(0)
    str.downcase.each_char { |char| counts[char] += 1 if VOWELS.include?(char) }
    counts
end