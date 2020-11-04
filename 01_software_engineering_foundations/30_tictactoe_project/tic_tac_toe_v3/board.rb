class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, '_') }
        @legal_pos = nil
    end

    def valid?(position)
        position.all? { |coord| coord >= 0 && coord < @grid.length }
    end

    def empty?(position)
        x, y = position
        @grid[x][y] == '_'
    end

    def place_mark(position, mark)
        if self.valid?(position) && self.empty?(position)
            x, y = position
            @grid[x][y] = mark
        else
            raise "Invalid position!"
        end
    end

    def print
        padding = (@grid.length * 2) + 1
        puts '_' * (padding + 2)
        puts '|' + ' ' * padding + '|'
        @grid.each { |row| puts "| " + row.join(" ") + " |" }
        puts '|' + '_' * padding + '|'
        puts
    end

    def win_row?(mark)
        @grid.any? do |row|
            row.all? { |ele| ele == mark }
        end
    end

    def win_col?(mark)
        (0...@grid.length).each do |i|
            return true if @grid.all? { |row| row[i] == mark }
        end
        false
    end

    def win_diagonal?(mark)
        # left to right
        diagonal = true
        (0...@grid.length).each do |i|
            if @grid[i][i] != mark
                diagonal = false
                break
            end
        end
        return true if diagonal

        # right to left
        diagonal = true
        j = @grid.length - 1
        (0...@grid.length).each do |i|
            if @grid[i][j] != mark
                diagonal = false
                break
            end
            j -= 1
        end

        diagonal
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any? do |row|
            row.any? { |ele| ele == '_' }
        end
    end

    def legal_positions
        if @legal_pos
            @legal_pos.select! { |pos| self.empty?(pos) }
        else
            @legal_pos = []
            (0...@grid.length).each do |i|
                (0...@grid.length).each { |j| @legal_pos << [i, j] }
            end
        end
        @legal_pos
    end
end