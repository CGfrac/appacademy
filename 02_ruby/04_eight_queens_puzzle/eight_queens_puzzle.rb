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
            if @board[row][col] == 'Q'
                @conflicts[[row,col]] += 1
                return
            end
            i -= 1
        end
    end

    def check_right(row, col)
        i = col
        while i < 8
            if @board[row][col] == 'Q'
                @conflicts[[row,col]] += 1
                return
            end
            i += 1
        end
    end

    def check_up(row, col)
        i = row
        while i >= 0
            if @board[row][col] == 'Q'
                @conflicts[[row,col]] += 1
                return
            end
            i -= 1
        end
    end

    def populate!
        (0..7).each do |row|
            col = rand(0..7)
            @board[row][col] = 'Q'
            # check conflicts here
        end
    end

    def print
        @board.each { |row| puts row.join(' ') }
    end
end

board = EightQueensBoard.new
board.print