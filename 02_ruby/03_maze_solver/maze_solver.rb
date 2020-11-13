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

def a_star(maze)
    a = find_element(maze, 'S')
    b = find_element(maze, 'E')
    open = [Node.new(a)]
    
    while open.length > 0
        # look for lowest F in open list
        # switch it to closed list
            # break if current's coordinates == b
        # check all 8 adjacent squares
            # ignore if in closed list or unwalkable
            # if not in open list:
                # set current node as parent
                # add it with its own G, H and F values
            # if in open list:
                # see if G score from current is lower
                # if it is, change parent to current, update G/F (sort open here again if open is sorted)
    end
    # work backward from closed[-1] to start and register path
end

if ARGV.length != 1
    raise "Correct usage: maze_solver.rb <path_to_maze_txt>"
end
maze = []
File.open(ARGV[0]).each_line { |line| maze << line.chomp.split("") }

a_star(maze)
maze.each { |row| puts row.join }