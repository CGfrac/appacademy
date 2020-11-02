# Write a method selected_map! that accepts an array and two procs as arguments. 
# The method should replace the elements that return true when passed into the first proc with their return values when they are passed into the second proc. 
# This method should mutate the input array and return nil.

def selected_map!(arr, prc_1, prc_2)
    arr.map! do |ele|
        if prc_1.call(ele)
            prc_2.call(ele)
        else
            ele
        end
    end
    nil
end

puts "-----------------------------------"
puts "selected_map!"
puts "-----------------------------------"
is_even = Proc.new { |n| n.even? }
is_positive = Proc.new { |n| n > 0 }
square = Proc.new { |n| n * n }
flip_sign = Proc.new { |n| -n }

arr_1 = [8, 5, 10, 4]
p selected_map!(arr_1, is_even, square)     # nil
p arr_1                                     # [64, 5, 100, 16]

arr_2 = [-10, 4, 7, 6, -2, -9]
p selected_map!(arr_2, is_even, flip_sign)  # nil
p arr_2                                     # [10, -4, 7, -6, 2, -9]

arr_3 = [-10, 4, 7, 6, -2, -9]
p selected_map!(arr_3, is_positive, square) # nil
p arr_3                                     # [-10, 16, 49, 36, -2, -9]

# Write a method that accepts any value and an array of procs as an argument. 
# The method should return the final result of feeding the value through all of the procs. 
# For example, if the array contains three procs, then:

#     the value is given to the first proc
#     the result of the first proc is given to the second proc
#     the result of the second proc is given to the third proc
#     the result of third proc is the final result

def chain_map(value, prcs)
    prcs.each { |prc| value = prc.call(value) }
    value
end

puts "-----------------------------------"
puts "chain_map"
puts "-----------------------------------"
add_5 = Proc.new { |n| n + 5 }
half = Proc.new { |n| n / 2.0 }
square = Proc.new { |n| n * n }

p chain_map(25, [add_5, half])          # 15.0
p chain_map(25, [half, add_5])          # 17.5
p chain_map(25, [add_5, half, square])  # 225
p chain_map(4, [square, half])          # 8
p chain_map(4, [half, square])          # 4

# Write a method proc_suffix that accepts a sentence and a hash as arguments. 
# The hash contains procs as keys and suffix strings as values. 
# The method should return a new sentence where each word of the original sentence is appended 
# with a suffix if the original word returns true when given to the corresponding proc key. 
# If an original word returns true for multiple procs, then the suffixes should be appended in the order that they appear in the input hash.

def proc_suffix(sentence, hash)
    new_sentence = []
    sentence.split.each do |word|
        new_word = word[0..-1]
        hash.each_key do |prc|
            new_word += hash[prc] if prc.call(word)
        end
        new_sentence << new_word
    end
    new_sentence.join(" ")
end

puts "-----------------------------------"
puts "proc_suffix"
puts "-----------------------------------"
contains_a = Proc.new { |w| w.include?('a') }
three_letters = Proc.new { |w| w.length == 3 }
four_letters = Proc.new { |w| w.length == 4 }

p proc_suffix('dog cat',
    contains_a => 'ly',
    three_letters => 'o'
)   # "dogo catlyo"

p proc_suffix('dog cat',
    three_letters => 'o',
    contains_a => 'ly'
)   # "dogo catoly"

p proc_suffix('wrong glad cat',
    contains_a => 'ly',
    three_letters => 'o',
    four_letters => 'ing'
)   # "wrong gladlying catlyo"

p proc_suffix('food glad rant dog cat',
    four_letters => 'ing',
    contains_a => 'ly',
    three_letters => 'o'
)   # "fooding gladingly rantingly dogo catlyo"

# Write a method proctition_platinum that accepts an array and any number of additional procs as arguments. 
# The method should return a hash where the keys correspond to the number of procs passed in.

#     For example, if three procs are passed in, then the hash should have the keys 1, 2, and 3.

# The values associated with each key should be an array containing the elements of the input array that return true when passed into the corresponding proc.

#     For example, this means that the array that corresponds to the key 2 should contain the elements that return true when passed into the second proc.

# If an element returns true for multiple procs, then it should only be placed into the array that corresponds to the proc that appears first in the arguments.

def proctition_platinum(arr, *prcs)
    hash = {}
    (1..prcs.length).each { |i| hash[i] = [] }
    arr.each do |ele|
        prcNumber = 1
        prcs.each do |prc|
            if prc.call(ele)
                hash[prcNumber] << ele
                break
            end
            prcNumber += 1
        end
    end
    hash
end

puts "-----------------------------------"
puts "proctition_platinum"
puts "-----------------------------------"
is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
begins_w = Proc.new { |s| s.downcase[0] == 'w' }

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, contains_a)
# {1=>["when!", "WHERE!"], 2=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, is_upcase, contains_a)
# {1=>["when!", "WHERE!"], 2=>["WHO", "WHY"], 3=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_upcase, is_yelled, contains_a)
# {1=>["WHO", "WHERE!", "WHY"], 2=>["when!"], 3=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], begins_w, is_upcase, is_yelled, contains_a)
# {1=>["WHO", "what", "when!", "WHERE!", "WHY"], 2=>[], 3=>[], 4=>[]}

# Write a method procipher that accepts a sentence and a hash as arguments. 
# The hash contains procs as both keys and values. 
# The method should return a new sentence where each word of the input sentence is changed by a value proc 
# if the original word returns true when passed into the key proc. 
# If an original word returns true for multiple key procs, then the value proc changes should be applied in the order that they appear in the hash.

def procipher(sentence, hash)
    new_sentence = []

    sentence.split.each do |word|
        new_word = word[0..-1]
        hash.each_key do |prc|
            new_word = hash[prc].call(new_word) if prc.call(word) 
        end
        new_sentence << new_word
    end

    new_sentence.join(" ")
end

puts "-----------------------------------"
puts "procipher"
puts "-----------------------------------"
is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
make_question = Proc.new { |s| s + '???' }
reverse = Proc.new { |s| s.reverse }
add_smile = Proc.new { |s| s + ':)' }

p procipher('he said what!',
    is_yelled => make_question,
    contains_a => reverse
) # "he dias ???!tahw"

p procipher('he said what!',
    contains_a => reverse,
    is_yelled => make_question
) # "he dias !tahw???"

p procipher('he said what!',
    contains_a => reverse,
    is_yelled => add_smile
) # "he dias !tahw:)"

p procipher('stop that taxi now',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "stop that??? taxi??? now"

p procipher('STOP that taxi now!',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "STOP:) that??? taxi??? !won"