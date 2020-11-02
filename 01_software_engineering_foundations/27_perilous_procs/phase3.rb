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