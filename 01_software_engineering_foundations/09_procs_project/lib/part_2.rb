def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    new_str = str.split.map { |word| prc.call(word) }
    new_str.join(" ")
end