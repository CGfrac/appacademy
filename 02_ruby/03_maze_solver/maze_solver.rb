require_relative "node.rb"

MOVES = [
    [-1,0], [0,-1], [1,0], [0,1], # straights
    [-1,-1], [1,1], [1,-1], [1,1]  # diagonals
]

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
    start = find_element(maze, 'S')
    target = find_element(maze, 'E')

    current = Node.new(start, target)
    sorted_by_f = [current]

    coord = "#{start[0]}:#{start[1]}"
    nodes = {}
    nodes[coord] = current

    open = Hash.new(false)
    closed = Hash.new(false)
    open[coord] = true
    open_count = 1

    while open_count > 0
        # look for lowest F in list
        current = sorted_by_f.shift

        x, y = current.coordinates
        coord = "#{x}:#{y}"

        open[coord] = false
        open_count -= 1
        closed[coord] = true

        break if maze[x][y] == 'E'

        # check all 8 adjacent squares
        MOVES.each_with_index do |move, index|
            i = move[0] + x
            j = move[1] + y
            coord = "#{i}:#{j}"
            g = index < 4 ? 10 : 14
            if closed[coord] || maze[i][j] == '*'
                next
            elsif open[coord]
                node = nodes[coord]
                if current.g + g < node.g
                    node.parent = current
                    node.g = current.g + g
                end
            else
                sorted_by_f << Node.new([i,j], target, current, current.g + g)
                nodes[coord] = sorted_by_f[-1]
                open[coord] = true
                open_count += 1
            end
        end
        # sort according to F
        sorted_by_f.sort_by! { |node| node.f }
    end
    if maze[x][y] != 'E'
        puts "There is no valid path"
        return
    end
    # work backward from target to start and register path
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