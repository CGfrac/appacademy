# Write a method matrix_addition_reloaded that accepts any number of matrices as arguments.
# The method should return a new matrix representing the sum of the arguments.
# Matrix addition can only be performed on matrices of similar dimensions, 
# so if all of the given matrices do not have the same "height" and "width", then return nil.

def matrix_addition_reloaded(*matrices)
    new_matrix = matrices.pop
    matrices.each do |matrix|
        return nil if matrix.length != new_matrix.length || matrix[0].length != new_matrix[0].length
        (0...matrix.length).each do |i|
            (0...matrix[0].length).each do |j|
                new_matrix[i][j] += matrix[i][j]
            end
        end
    end
    new_matrix
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

puts "-----------------------------------"
puts "matrix_addition_reloaded"
puts "-----------------------------------"
p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

# Write a method squarocol? that accepts a 2-dimensional array as an argument.
# The method should return a boolean indicating whether or not any row or column is completely filled with the same element.
# You may assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

def squarocol?(arr)
    # rows
    (0...arr.length).each do |i|
        first = arr[i][0]
        combo = true
        (1...arr[i].length).each do |j|
            if arr[i][j] != first
                combo = false
                break
            end
        end
        return true if combo
    end

    # cols
    (0...arr[0].length).each do |i|
        first = arr[0][i]
        combo = true
        (1...arr.length).each do |j|
            if arr[j][i] != first 
                combo = false
                break
            end
        end
        return true if combo
    end

    false
end

puts "-----------------------------------"
puts "squarocol?"
puts "-----------------------------------"
p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false

# Write a method squaragonal? that accepts 2-dimensional array as an argument.
# The method should return a boolean indicating whether or not the array contains all of the same element across either of its diagonals.
# You may assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

def squaragonal?(arr)
    i = 1
    first = arr[0][0]
    combo = true
    while i < arr.length
        if arr[i][i] != first
            combo = false
            break
        end
        i += 1
    end
    return true if combo

    i = 0
    j = arr.length - 1
    first = arr[0][-1]
    combo = true
    while i < arr.length
        if arr[i][j] != first
            combo = false
            break
        end
        i += 1
        j -= 1
    end
    return true if combo

    false
end

puts "-----------------------------------"
puts "squaragonal?"
puts "-----------------------------------"
p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false

# Pascal's triangle is a 2-dimensional array with the shape of a pyramid. The top of the pyramid is the number 1. 
# To generate further levels of the pyramid, every element is the sum of the element above and to the left with the element above and to the right. 
# Nonexisting elements are treated as 0 when calculating the sum. For example, here are the first 5 levels of Pascal's triangle:

#       1
#      1 1
#     1 2 1
#    1 3 3 1
#   1 4 6 4 1

# Write a method pascals_triangle that accepts a positive number, n, as an argument 
# and returns a 2-dimensional array representing the first n levels of pascal's triangle.

def pascals_triangle(n)
    triangle = []
    (1..n).each do |i|
        row = Array.new(i, 1)
        (1...row.length-1).each { |j| row[j] = triangle[-1][j-1] + triangle[-1][j] }
        triangle << row
    end
    triangle
end

p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]