def hipsterfy(word)
    vowels = "aeiou"
    i = word.length - 1
    while i > 0
        if vowels.include?(word[i])
            word[i] = ""
            break
        end
        i -= 1
    end
    word
end