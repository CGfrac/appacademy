def find_start(maze)
    maze.each_with_index do |row, i|
        row.each_with_index do |cell, j|
            if cell == 'S'
                return [i, j]
            end
        end
    end
end

def naive_pathfinding(maze, start)
    #
end

maze = []
File.open(ARGV[0]).each_line { |line| maze << line.chomp.split("") }
maze.each { |row| puts row.join }

start = find_start(maze)
naive_pathfinding(maze, start)
maze.each { |row| puts row.join }