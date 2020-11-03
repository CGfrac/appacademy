VOWELS = "aeiou"

# Write a method conjunct_select that accepts an array and one or more procs as arguments. 
# The method should return a new array containing the elements that return true when passed into all of the given procs.

def conjunct_select(arr, *prcs)
    arr.select do |ele|
        prcs.all? { |prc| prc.call(ele) }
    end
end

puts "-----------------------------------"
puts "conjunct_select"
puts "-----------------------------------"
is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

# Write a method convert_pig_latin that accepts a sentence as an argument. 
# The method should translate the sentence according to the following rules:

#     words that are shorter than 3 characters are unchanged
#     words that are 3 characters or longer are translated according to the following rules:
#         if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
#         if the word begins with a non-vowel, move all letters that come before the word's first vowel to the end of the word and add 'ay' 
#               (example: 'trash'->'ashtray')

# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. 
# Vowels are the letters a, e, i, o, u.

def convert_pig_latin(sentence)
    new_sentence = []
    sentence.split.each do |word|
        if word.length < 3
            new_sentence << word
        elsif VOWELS.include?(word[0].downcase)
            new_sentence << word + "yay"
        else
            i = 0
            while i < word.length
                break if VOWELS.include?(word[i])
                i += 1
            end
            if i < word.length
                new_word = word[i..-1] + word[0...i].downcase + "ay"
                new_word.capitalize! if word == word.capitalize
                new_sentence << new_word
            else
                new_sentence << word
            end
        end
    end
    new_sentence.join(" ")
end

puts "-----------------------------------"
puts "convert_pig_latin"
puts "-----------------------------------"
p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

# Write a method reverberate that accepts a sentence as an argument. 
# The method should translate the sentence according to the following rules:

#     words that are shorter than 3 characters are unchanged
#     words that are 3 characters or longer are translated according to the following rules:
#         if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
#         if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the last vowel itself
#             (example: 'trash'->'trashash')

# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. 
# Vowels are the letters a, e, i, o, u.

def reverberate(sentence)
    new_sentence = []
    sentence.split.each do |word|
        if word.length < 3
            new_sentence << word
        elsif VOWELS.include?(word[-1])
            new_sentence << word + word.downcase
        else
            i = word.length - 1
            while i >= 0
                break if VOWELS.include?(word[i])
                i -= 1
            end
            if i >= 0
                new_sentence << word + word[i..-1]
            else
                new_sentence << word
            end
        end
    end
    new_sentence.join(" ")
end

puts "-----------------------------------"
puts "reverberate"
puts "-----------------------------------"
p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

# Write a method disjunct_select that accepts an array and one or more procs as arguments. 
# The method should return a new array containing the elements that return true when passed into at least one of the given procs.

def disjunct_select(arr, *prcs)
    arr.select do |ele|
        prcs.any? { |prc| prc.call(ele) }
    end
end

puts "-----------------------------------"
puts "disjunct_select"
puts "-----------------------------------"
longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
) # ["apple", "teeming"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o
) # ["dog", "apple", "teeming", "boot"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o,
    starts_a
) # ["ace", "dog", "apple", "teeming", "boot"]

# Write a method alternating_vowel that accepts a sentence as an argument. 
# The method should return a new sentence where the words alternate between having their first or last vowel removed. 
# For example:

#     the 1st word should be missing its first vowel
#     the 2nd word should be missing its last vowel
#     the 3rd word should be missing its first vowel
#     the 4th word should be missing its last vowel
#     ... and so on

# Note that words that contain no vowels should remain unchanged. 
# Vowels are the letters a, e, i, o, u.

def alternating_vowel(sentence)
    new_sentence = []
    sentence.split.each_with_index do |word, idx|
        i = 0
        if idx.even?
            while i < word.length 
                break if VOWELS.include?(word[i])
                i += 1
            end
        else
            i = word.length - 1
            while i >= 0
                break if VOWELS.include?(word[i])
                i -= 1
            end
        end
        if i >= 0 && i < word.length 
            new_sentence << word[0...i] + word[i+1..-1]
        else
            new_sentence << word
        end
    end
    new_sentence.join(" ")
end

puts "-----------------------------------"
puts "alternating_vowel"
puts "-----------------------------------"
p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

# Write a method silly_talk that accepts a sentence as an argument. 
# The method should translate each word of the sentence according to the following rules:

#     if the word ends with a vowel, simply repeat that vowel at the end of the word (example: 'code'->'codee')
#     if the word ends with a non-vowel, every vowel of the word should be followed by 'b' and that same vowel (example: 'siren'->'sibireben')

# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. 
# Vowels are the letters a, e, i, o, u.

def silly_talk(sentence)
    new_sentence = []
    sentence.split.each do |word|
        if VOWELS.include?(word[-1])
            new_sentence << word + word[-1]
        else
            new_word = ""
            word.each_char do |char|
                new_word += char
                new_word += "b" + char.downcase if VOWELS.include?(char.downcase)
            end
            new_sentence << new_word
        end
    end
    new_sentence.join(" ")
end

puts "-----------------------------------"
puts "silly_talk"
puts "-----------------------------------"
p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"
