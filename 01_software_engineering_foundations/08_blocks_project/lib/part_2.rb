def all_words_capitalized?(arr)
    arr.all? { |word| word == word.capitalize }
end

def no_valid_url?(arr)
    valid_endings = [".com", ".net", ".io", ".org"]
    arr.none? do |url| 
        valid_endings.any? { |ending| url.end_with?(ending) }
    end
end

def any_passing_students?(students)
    students.any? do |student|
        grades = student[:grades]
        avg = grades.sum / (grades.length * 1.0)
        avg >= 75
    end
end