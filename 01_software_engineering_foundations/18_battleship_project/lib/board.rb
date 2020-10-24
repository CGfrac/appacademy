class Board
    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row|
            line = ""
            row.each do |ele|
                line += "#{ele} "
            end
            line[-1] = ""
            puts line
        end
    end

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def num_ships
        @grid.flatten.count { |ele| ele == :S }
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        n = @grid.length
        max_ships = @size / 4
        while self.num_ships < max_ships
            row = rand(0...n)
            col = rand(0...n)
            pos = [row, col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    ele = :N
                else
                    ele
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
