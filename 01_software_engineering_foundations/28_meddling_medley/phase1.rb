# Write a method duos that accepts a string as an argument and returns the 
# count of the number of times the same character appears consecutively in the given string.

def duos(str)
    count = 0
    (1...str.length).each { |i| count += 1 if str[i] == str[i - 1] }
    count
end

puts "-----------------------------------"
puts "duos"
puts "-----------------------------------"
p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0

# Write a method sentence_swap that accepts a sentence and a hash as arguments. 
# The method should return a new sentence where every word is replaced with it's corresponding value in the hash. 
# If a word does not exist as a key of the hash, then it should remain unchanged.

def sentence_swap(sentence, hash)
    new_sentence = sentence.split.map do |word|
        if hash.has_key?(word)
            hash[word]
        else
            word
        end
    end
    new_sentence.join(" ")
end

puts "-----------------------------------"
puts "sentence_swap"
puts "-----------------------------------"
p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'

# Write a method hash_mapped that accepts a hash, a proc, and a block. 
# The method should return a new hash where each key is the result of the original key when given to the block. 
# Each value of the new hash should be the result of the original values when passed into the proc.

def hash_mapped(hash, prc, &block)
    new_hash = {}
    hash.each { |k, v| new_hash[block.call(k)] = prc.call(v) }
    new_hash
end

puts "-----------------------------------"
puts "hash_mapped"
puts "-----------------------------------"
double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}

# Write a method counted_characters that accepts a string as an argument. 
# The method should return an array containing the characters of the string that appeared more than twice.
# The characters in the output array should appear in the same order they occur in the input string.

def counted_characters(str)
    counter = Hash.new(0)
    str.each_char { |char| counter[char] += 1 }
    counter.keys.select { |k| counter[k] > 2 }
end

puts "-----------------------------------"
puts "counted_characters"
puts "-----------------------------------"
p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []

# Write a method triplet_true? that accepts a string as an argument and returns a boolean indicating 
# whether or not the string contains three of the same character consecutively.

def triplet_true?(str)
    prev = ""
    combo = 0
    str.each_char do |char|
        if char == prev
            combo += 1
            return true if combo == 3
        else
            combo = 1
            prev = char
        end
    end
    false
end

puts "-----------------------------------"
puts "triplet_true?"
puts "-----------------------------------"
p triplet_true?('caaabb')        # true
p triplet_true?('terrrrrible')   # true
p triplet_true?('runninggg')     # true
p triplet_true?('bootcamp')      # false
p triplet_true?('e')             # false

# Write a method energetic_encoding that accepts a string and a hash as arguments. 
# The method should return a new string where characters of the original string are replaced with the corresponding values in the hash. 
# If a character is not a key of the hash, then it should be replaced with a question mark ('?'). 
# Space characters (' ') should remain unchanged.

def energetic_encoding(str, hash)
    new_string = ""
    str.each_char do |char|
        if hash.has_key?(char)
            new_string += hash[char]
        elsif char == " "
            new_string += char
        else
            new_string += "?"
        end
    end
    new_string
end

puts "-----------------------------------"
puts "energetic_encoding"
puts "-----------------------------------"
p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'

# Write a method uncompress that accepts a string as an argument. 
# The string will be formatted so every letter is followed by a number. 
# The method should return an "uncompressed" version of the string where every letter is repeated multiple times 
# given based on the number that appears directly after the letter.

def uncompress(str)
    uncompressed = ""
    curr = ""
    str.each_char.with_index do |char, idx|
        if idx.even?
            curr = char
        else
            uncompressed += curr * char.to_i
        end
    end
    uncompressed
end

puts "-----------------------------------"
puts "uncompress"
puts "-----------------------------------"
p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'