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