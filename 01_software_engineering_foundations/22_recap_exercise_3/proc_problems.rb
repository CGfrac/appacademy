class String
    # Extend the string class by defining a String#select method that accepts a block.
    # The method should return a new string containing characters of the original string that return true when passed into the block.
    # If no block is passed, then return the empty string. Do not use the built-in Array#select in your solution.

    def select(&prc)
        new_string = ""
        return new_string if prc.nil?
        self.each_char { |char| new_string += char if prc.call(char) }
        new_string
    end

    # Extend the string class by defining a String#map! method that accepts a block.
    # The method should modify the existing string by replacing every character with the result of calling the block,
    # passing in the original character and it's index.
    # Do not use the built-in Array#map or Array#map! in your solution.

    def map!(&prc)
        self.each_char.with_index { |char, idx| self[idx] = prc.call(char, idx) }
    end
end

puts "---------------------------------"
puts "String#select"
puts "---------------------------------"
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""
puts "---------------------------------"


puts "String#map!"
puts "---------------------------------"
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"
puts "---------------------------------"