# populate row by row in a random column each time
# at each placement check conflicts
# sort by conflicts
# move biggest conflicts to least collisions column
# repeat 2 previous steps until there is no conflict

require "byebug"

class EightQueensBoard
    def initialize
        @board = Array.new(8) { Array.new(8, '_') }
        @conflicts = {}
        self.populate!
        self.resolve_conflicts
    end

    def check_left(row, col)
        i = col - 1
        while i >= 0
            if @board[row][i] == 'Q'
                return 1
            end
            i -= 1
        end
        0
    end

    def check_right(row, col)
        i = col + 1
        while i < 8
            if @board[row][i] == 'Q'
                return 1
            end
            i += 1
        end
        0
    end

    def check_up(row, col)
        i = row - 1
        while i >= 0
            if @board[i][col] == 'Q'
                return 1
            end
            i -= 1
        end
        0
    end

    def check_down(row, col)
        i = row + 1
        while i < 8
            if @board[i][col] == 'Q'
                return 1
            end
            i += 1
        end
        0
    end

    def check_diagonal_top_left(row, col)
        i = row - 1
        j = col - 1
        while i >= 0 && j >= 0
            if @board[i][j] == 'Q'
                return 1
            end
            i -= 1
            j -= 1
        end
        0
    end

    def check_diagonal_top_right(row, col)
        i = row - 1
        j = col + 1
        while i >= 0 && j < 8
            if @board[i][j] == 'Q'
                return 1
            end
            i -= 1
            j += 1
        end
        0
    end

    def check_diagonal_bottom_left(row, col)
        i = row + 1
        j = col - 1
        while i < 8 && j >= 0
            if @board[i][j] == 'Q'
                return 1
            end
            i += 1
            j -= 1
        end
        0
    end

    def check_diagonal_bottom_right(row, col)
        i = row + 1
        j = col + 1
        while i < 8 && j < 8
            if @board[i][j] == 'Q'
                return 1
            end
            i += 1
            j += 1
        end
        0
    end

    def check_conflicts(row, col)
        count = 0
        count += self.check_left(row, col)
        count += self.check_right(row, col)
        count += self.check_up(row, col)
        count += self.check_down(row, col)
        count += self.check_diagonal_top_left(row, col)
        count += self.check_diagonal_top_right(row, col)
        count += self.check_diagonal_bottom_left(row, col)
        count += self.check_diagonal_bottom_right(row, col)
        count
    end

    def update_conflicts
        @conflicts.each_key { |coord| @conflicts[coord] = self.check_conflicts(*coord) }
    end

    def populate!
        (0..7).each do |row|
            col = rand(0..7)
            @board[row][col] = 'Q'
            @conflicts[[row,col]] = 0
        end
        self.update_conflicts
    end

    def resolve_conflicts
        to_move = @conflicts.keys.select { |coord| @conflicts[coord] > 0 }
        while to_move.length > 0
            to_move.sort_by! { |coord| @conflicts[coord] }
            row, col = to_move.pop

            @board[row][col] = ' '
            @conflicts.delete([row,col])

            conflict_counts = []
            (0..7).each { |i| conflict_counts << self.check_conflicts(row, i) }

            min_conflicts = conflict_counts.min
            min_indexes = []
            conflict_counts.each_with_index { |count, index| min_indexes << index if count == min_conflicts }

            new_col = min_indexes.sample
            @board[row][new_col] = 'Q'
            @conflicts[[row, new_col]] = 0
            
            self.update_conflicts
            to_move = @conflicts.keys.select { |coord| @conflicts[coord] > 0 }
        end
    end

    def print
        @board.each { |row| puts row.join(' ') }
    end
end

board = EightQueensBoard.new
board.print