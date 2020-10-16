def palindrome?(str)
    str.each_char.with_index { |char, i| return false if str[i] != str[-i - 1] }
    true
end

def substrings(str)
    arr = []
    (0...str.length).each do |i|
        (i...str.length).each { |j| arr << str[i..j] }
    end
    arr
end

def palindrome_substrings(str)
    substrings(str).select { |substr| substr.length > 1 && palindrome?(substr) }
end