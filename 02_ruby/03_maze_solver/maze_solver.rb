require_relative "node.rb"

def find_element(maze, char)
    maze.each_with_index do |row, i|
        row.each_with_index do |cell, j|
            if cell == char
                return [i, j]
            end
        end
    end
end

# See http://archive.gamedev.net/archive/reference/articles/article2003.html for the underlying logic
def a_star(maze)
    start_x, start_y = find_element(maze, 'S')
    target = find_element(maze, 'E')

    current = Node.new([start_x, start_y], target)
    binary_heap = [current]

    addresses = Hash.new { |h, k| h[k] = { open:false, closed:false, node:nil } }
    addresses["#{start_x}:#{start_y}"][:open] = true
    open_count = 1

    moves = [
        [-1,0], [0,-1], [1,0], [0,1], # straights
        [-1,-1], [1,1], [1,-1], [1,1]  # diagonals
    ]

    while open_count > 0
        # look for lowest F in open list
        binary_heap[0], binary_heap[-1] = binary_heap[-1], binary_heap[0]
        current = binary_heap.pop
        index = 1
        while (index * 2) <= binary_heap.length
            a = index-1
            b = (index * 2) - 1
            if binary_heap[a].f > binary_heap[b].f
                binary_heap[a], binary_heap[b] = binary_heap[b], binary_heap[a]
            end
            index *= 2
        end

        x, y = current.coordinates
        address = "#{x}:#{y}"

        addresses[address][:open] = false
        open_count -= 1
        addresses[address][:closed] = true

        break if maze[x][y] == 'E'

        # check all 8 adjacent squares
        moves.each_with_index do |move, index|
            i = move[0] + x
            j = move[1] + y
            coord = "#{i}:#{j}"
            g = index < 4 ? 10 : 14
            if addresses[coord][:closed] || maze[i][j] == '*'
                next
            elsif addresses[coord][:open]
                node = addresses[coord][:node]
                if g < node.g
                    node.parent = current
                    node.g = g
                end
            else
                binary_heap << Node.new([i,j], target, current, g)
                addresses[coord][:node] = binary_heap[-1]
                addresses[coord][:open] = true
                open_count += 1
            end
            # sort binary_heap according to F
            index = binary_heap.length
            while (index / 2) >= 1
                a = (index / 2) - 1
                b = index - 1
                if binary_heap[a].f > binary_heap[b].f
                    binary_heap[a], binary_heap[b] = binary_heap[b], binary_heap[a]
                end
                index /= 2
            end
        end
    end
    # work backward from closed[-1] to start and register path
    current = current.parent
    while current.parent
        x, y = current.coordinates
        maze[x][y] = 'X'
        current = current.parent
    end
end

if ARGV.length != 1
    raise "Correct usage: maze_solver.rb <path_to_maze_txt>"
end
maze = []
File.open(ARGV[0]).each_line { |line| maze << line.chomp.split("") }

a_star(maze)
maze.each { |row| puts row.join }