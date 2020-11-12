def find_start(maze)
    maze.each_with_index do |row, i|
        row.each_with_index do |cell, j|
            if cell == 'S'
                return [i, j]
            end
        end
    end
end

maze = []
File.open("maze1.txt").each_line { |line| maze << line.chomp.split("") }

start = find_start(maze)