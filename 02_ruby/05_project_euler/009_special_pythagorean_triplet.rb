# Inspired from https://en.wikipedia.org/wiki/Tree_of_primitive_Pythagorean_triples
matrices = [
    [
        [1, -2, 2],
        [2, -1, 2],
        [2, -2, 3]
    ],
    [
        [1, 2, 2],
        [2, 1, 2],
        [2, 2, 3]
    ],
    [
        [-1, 2, 2],
        [-2, 1, 2],
        [-2, 2, 3]
    ]
]

def multiply(matrix, vector)
    new_vector = []
    matrix.each do |row|
        product = 0
        (0...vector.length).each do |index|
            product += row[index] * vector[index]
        end
        new_vector << product
    end
    new_vector
end

target = 1000
i = 1
while true
    queue = [[3*i, 4*i, 5*i]]
    until queue.empty?
        triple = queue.shift
        if triple.sum == target
            puts triple[0] * triple[1] * triple[2]
            exit
        elsif triple.sum < target
            matrices.each { |matrix| queue << multiply(matrix, triple) }
        end
    end
    i += 1
end
