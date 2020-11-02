# Write a method xnor_select that accepts an array and two procs as arguments. 
# The method should return a new array containing elements of the original array that either return true for both procs or return false for both procs.

def xnor_select(arr, proc_1, proc_2)
    arr.select { |ele| (proc_1.call(ele) && proc_2.call(ele)) || (!proc_1.call(ele) && !proc_2.call(ele)) }
end

puts "-----------------------------------"
puts "xnor_select"
puts "-----------------------------------"
is_even = Proc.new { |n| n % 2 == 0 }
is_odd = Proc.new { |n| n % 2 != 0 }
is_positive = Proc.new { |n| n > 0 }
p xnor_select([8, 3, -4, -5], is_even, is_positive)         # [8, -5]
p xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)  # [-7, -13, 12]
p xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)   # [5, -10]

# Rewrite your previous filter_out method to mutate the input array instead of returning a new array. 
# That is, write a method filter_out! that accepts an array and a block as args. 
# The method should remove elements of the input array that return true when given to the block. 
# Solve this without using Array.reject!.

def filter_out!(arr, &prc)
    i = 0
    while i < arr.length
        if prc.call(arr[i])
            arr.delete_at(i)
        else
            i += 1
        end
    end
end

puts "-----------------------------------"
puts "filter_out!"
puts "-----------------------------------"
arr_1 = [10, 6, 3, 2, 5 ]
filter_out!(arr_1) { |x| x.odd? }
p arr_1     # [10, 6, 2]

arr_2 = [1, 7, 3, 5 ]
filter_out!(arr_2) { |x| x.odd? }
p arr_2     # []

arr_3 = [10, 6, 3, 2, 5 ]
filter_out!(arr_3) { |x| x.even? }
p arr_3     # [3, 5]

arr_4 = [1, 7, 3, 5 ]
filter_out!([1, 7, 3, 5 ]) { |x| x.even? }
p arr_4 # [1, 7, 3, 5]