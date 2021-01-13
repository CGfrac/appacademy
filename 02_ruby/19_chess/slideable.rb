module Slideable
    HORIZONTAL_DIRS = [
        [-1, 0], [0, 1], [1, 0], [0, -1]
    ]
    DIAGONAL_DIRS = [
        [-1, -1], [-1, 1], [1, -1], [1, 1]
    ]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        moves = []
        self.move_dirs.each do |pos|
            moves += self.grow_unblocked_moves_in_dir(*pos)
        end
        moves
    end

    private
    def move_dirs
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        moves = []
        new_pos = [@pos[0] + dx, @pos[1] + dy]
        while new_pos[0].between?(0,8) && new_pos[1].between?(0,8)
            break unless @board[*new_pos].empty? || @board[*new_pos].color != @color
            moves << new_pos
            break unless @board[*new_pos].empty?
            new_pos[0] += dx 
            new_pos[1] += dy
        end
        moves
    end
end