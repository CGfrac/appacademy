def print_problem_name(name)
    hr = '-' * 20
    puts hr
    puts name
    puts hr
end

#Problem 1: 

def sum_recur(array)
    return 0 if array.length == 0
    array[0] + sum_recur(array[1..-1])
end

print_problem_name("sum_recur")
p sum_recur([16, 16, 5, 7, 13, 8, 19, 17, 0, 8]) # 109

#Problem 2: 

def includes?(array, target)
end

print_problem_name("includes?")

# Problem 3: 

def num_occur(array, target)
end

print_problem_name("num_occur")

# Problem 4: 

def add_to_twelve?(array)
end

print_problem_name("add_to_twelve?")

# Problem 5: 

def sorted?(array)
end

print_problem_name("sorted?")

# Problem 6: 

def reverse(string)
end

print_problem_name("reverse")
