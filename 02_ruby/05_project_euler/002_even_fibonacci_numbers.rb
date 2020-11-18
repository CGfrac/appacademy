LIMIT = 4000000

def fib(a, b)
    return 0 if a > LIMIT
    sum = 0
    sum += a if a.even?
    sum += fib(b, a + b)
end

puts fib(1,1)