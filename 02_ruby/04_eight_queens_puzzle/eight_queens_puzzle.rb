# populate row by row in a random column each time
# at each placement check conflicts
# sort by conflicts
# move biggest conflicts to least collisions column
# repeat 2 previous steps until there is no conflict

class EightQueensBoard
    def initialize
        @board = Array.new(8) { Array.new(8, '_') }
    end

    def populate!
        (0..7).each do |row|
            index = rand(0..7)
            @board[row][index] = 'Q'
            # check conflicts here
        end
    end

    def print
        @board.each { |row| puts row.join(' ') }
    end
end

board = EightQueensBoard.new
board.print