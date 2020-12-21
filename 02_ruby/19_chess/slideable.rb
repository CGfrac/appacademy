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
        i = 1
        g_dx, g_dy = dx, dy
        while g_dx.between?(0,8) && g_dy.between?(0,8)
            g_dx = dx * i
            g_dy = dx * i
            break unless board[g_dx, g_dy].empty? || board[g_dx, g_dy].color != color
            moves << [g_dx, g_dy]
            break unless board[g_dx, g_dy].empty?
            i += 1
        end
        moves
    end
end