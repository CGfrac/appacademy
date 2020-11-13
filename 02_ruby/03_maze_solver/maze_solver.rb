def find_element(maze, char)
    maze.each_with_index do |row, i|
        row.each_with_index do |cell, j|
            if cell == char
                return [i, j]
            end
        end
    end
end

def naive_pathfinding(maze)
    x, y = find_element(maze, 'S')
    while true
        while maze[x-1][y] == ' '
            x -= 1
            maze[x][y] = 'X'
        end
        while maze[x][y+1] == ' '
            y += 1
            maze[x][y] = 'X'
        end
        if maze[x][y+1] == 'E'
            return
        end
        while maze[x][y+1] == '*'
            x += 1
            maze[x][y] = 'X'
        end
        while maze[x-1][y] != ' '
            y += 1
            maze[x][y] = 'X'
        end
    end
end

if ARGV.length != 1
    raise "Correct usage: maze_solver.rb <path_to_maze_txt>"
end
maze = []
File.open(ARGV[0]).each_line { |line| maze << line.chomp.split("") }

naive_pathfinding(maze)
maze.each { |row| puts row.join }