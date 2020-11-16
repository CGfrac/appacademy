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
        @steps = 0
        self.populate!
        self.resolve_conflicts!
        puts "Board solved in #{@steps} steps"
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

    def check_row(row, col)
        i = 0
        while i < 8
            return 1 if @board[row][i] == 'Q' && i != col
            i += 1
        end
        0
    end

    def check_diagonal_left_to_right(row, col)
        i = row - [row, col].min
        j = col - [row, col].min
        while i < 8 && j < 8
            return 1 if @board[i][j] == 'Q' && i != row && j != col
            i += 1
            j += 1
        end
        0
    end

    def check_conflicts(row, col)
        count = 0
        count += self.check_row(row, col)
        count += self.check_diagonal_left_to_right(row, col)
        count += self.check_diagonal_top_right(row, col)
        count += self.check_diagonal_bottom_left(row, col)
        count
    end

    def update_conflicts
        @conflicts.each_key { |coord| @conflicts[coord] = self.check_conflicts(*coord) }
    end

    def select_best_row(col)
        conflict_counts = []
        (0..7).each { |i| conflict_counts << self.check_conflicts(i, col) }

        min_conflicts = conflict_counts.min
        min_indexes = []
        conflict_counts.each_with_index { |count, index| min_indexes << index if count == min_conflicts }

        row = min_indexes.sample
        @board[row][col] = 'Q'
        @conflicts[[row,col]] = 0
    end

    def populate!
        (0..7).each do |col| 
            self.select_best_row(col)
            self.update_conflicts
        end
    end

    def resolve_conflicts!
        while true
            @steps += 1
            
            max_conflicts = @conflicts.values.max
            to_move = @conflicts.keys.select { |coord| @conflicts[coord] > 0 && @conflicts[coord] == max_conflicts }
            break if to_move.length == 0

            row, col = to_move.sample

            @board[row][col] = '_'
            @conflicts.delete([row,col])

            self.select_best_row(col)
            self.update_conflicts
        end
    end

    def print
        puts '_' * 17
        @board.each { |row| puts '|' + row.join('|') + '|' }
        puts
    end
end

board = EightQueensBoard.new
board.print