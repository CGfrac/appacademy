def palindrome?(str)
    reverse = ""
    str.each_char { |char| reverse = char + reverse }
    str == reverse
end