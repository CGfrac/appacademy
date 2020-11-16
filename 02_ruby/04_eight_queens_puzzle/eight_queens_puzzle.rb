# populate row by row in a random column each time
# at each placement check conflicts
# sort by conflicts
# move biggest conflicts to least collisions column
# repeat 2 previous steps until there is no conflict

class EightQueensBoard
    def initialize
        @board = Array.new(8) { Array.new(8, '_') }
        @conflicts = Hash.new(0)
        self.populate!
    end

    def check_left(row, col)
        i = col
        while i >= 0
            if @board[row][i] == 'Q'
                return 1
            end
            i -= 1
        end
        0
    end

    def check_right(row, col)
        i = col
        while i < 8
            if @board[row][i] == 'Q'
                return 1
            end
            i += 1
        end
        0
    end

    def check_up(row, col)
        i = row
        while i >= 0
            if @board[i][col] == 'Q'
                return 1
            end
            i -= 1
        end
        0
    end

    def check_down(row, col)
        i = row
        while i < 8
            if @board[i][col] == 'Q'
                return 1
            end
            i += 1
        end
        0
    end

    def check_diagonal_left_to_right(row, col)
        (0..7).each do |i|
            (0..7).each do |j|
                if i == row && j == col
                    next
                elsif @board[i][j] == 'Q'
                    return 1
                end
            end
        end
        0
    end

    def check_diagonal_right_to_left(row, col)
        j = 7
        (0..7).each do |i|
            if i == row && j == col
                next
            elsif @board[i][j] == 'Q'
                return 1
            end
            j -= 1
        end
        0
    end

    def check_conflicts(row, col)
        count = 0
        count += self.check_left(row, col)
        count += self.check_right(row, col)
        count += self.check_up(row, col)
        count += self.check_down(row, col)
        count += self.check_diagonal_left_to_right(row, col)
        count += self.check_diagonal_right_to_left(row, col)
        @conflicts[[row,col]] = count
    end

    def populate!
        (0..7).each do |row|
            col = rand(0..7)
            @board[row][col] = 'Q'
            self.check_conflicts(row, col)
        end
    end

    def print
        @board.each { |row| puts row.join(' ') }
    end
end

board = EightQueensBoard.new
board.print