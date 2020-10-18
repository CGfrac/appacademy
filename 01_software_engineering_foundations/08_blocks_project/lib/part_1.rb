def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] < 3}
end

def count_positive_subarrays(arr)
    arr.select! { |sub_arr| sub_arr.sum > 0 }
    arr.count
end