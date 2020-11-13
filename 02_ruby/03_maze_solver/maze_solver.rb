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
    #
end

if ARGV.length != 1
    raise "Correct usage: maze_solver.rb <path_to_maze_txt>"
end
maze = []
File.open(ARGV[0]).each_line { |line| maze << line.chomp.split("") }

a_star(maze)
maze.each { |row| puts row.join }