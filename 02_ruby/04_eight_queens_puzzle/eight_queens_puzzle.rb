# populate row by row in a random column each time
# at each placement check conflicts
# sort by conflicts
# move biggest conflicts to least collisions column
# repeat 2 previous steps until there is no conflict

class EightQueensBoard
    def initialize
        @board = Array.new(8) { Array.new(8, '_') }
        @conflicts = Hash.new(0)
    end

    def check_left(row, col)
        i = col
        while i >= 0
            if @board[row][i] == 'Q'
                @conflicts[[row,col]] += 1
                return
            end
            i -= 1
        end
    end

    def check_right(row, col)
        i = col
        while i < 8
            if @board[row][i] == 'Q'
                @conflicts[[row,col]] += 1
                return
            end
            i += 1
        end
    end

    def check_up(row, col)
        i = row
        while i >= 0
            if @board[i][col] == 'Q'
                @conflicts[[row,col]] += 1
                return
            end
            i -= 1
        end
    end

    def check_down(row, col)
        i = row
        while i < 8
            if @board[i][col] == 'Q'
                @conflicts[[row,col]] += 1
                return
            end
            i += 1
        end
    end

    def check_diagonal_left_to_right(row, col)
        (0..7).each do |i|
            (0..7).each do |j|
                if i == row && j == col
                    next
                elsif @board[i][j] == 'Q'
                    @conflicts[[row,col]] += 1
                    return
                end
            end
        end
    end

    def check_diagonal_right_to_left(row, col)
        j = 7
        (0..7).each do |i|
            if i == row && j == col
                next
            elsif @board[i][j] == 'Q'
                @conflicts[[row,col]] += 1
                return
            end
            j -= 1
        end
    end

    def check_conflicts(row, col)
        self.check_left(row, col)
        self.check_right(row, col)
        self.check_up(row, col)
        self.check_down(row, col)
        self.check_diagonal_left_to_right(row, col)
        self.check_diagonal_right_to_left(row, col)
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