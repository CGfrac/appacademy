def palindrome?(str)
    reverse = ""
    str.each_char { |char| reverse = char + reverse }
    str == reverse
end

def substrings(str)
    arr = []
    str.each_char.with_index do |char, i|
        (i...str.length).each { |j| arr << str[i..j] }
    end
    arr
end

def palindrome_substrings(str)
    arr = substrings(str)
    arr.select! { |substr| substr.length > 1 && palindrome?(substr) }
end