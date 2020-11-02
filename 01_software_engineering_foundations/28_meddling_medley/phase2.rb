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
            word.each_char.with_index do |char, idx|
                if VOWELS.include?(char)
                    new_word = word[idx..-1] + word[0...idx].downcase + "ay"
                    new_word.capitalize! if word == word.capitalize
                    new_sentence << new_word
                    break
                end
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
            while !VOWELS.include?(word[i])
                i -= 1
            end
            new_sentence << word + word[i..-1]
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