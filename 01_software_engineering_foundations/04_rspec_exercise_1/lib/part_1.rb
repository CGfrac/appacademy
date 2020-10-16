def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    arr.sum / (arr.length * 1.0)
end

def repeat(str, amt)
    str * amt
end

def yell(str)
    str.upcase! + "!"
end

def alternating_case(str)
    uppercase = true
    new_str = str.split.map do |word|
        if uppercase
            uppercase = false
            word.upcase
        else
            uppercase = true
            word.downcase
        end
    end
    new_str.join(" ")
end