def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] < 3}
end