class Game
    def initialize(file_path)
        grid = Board.from_file(file_path)
        @board = Board.new(grid)
    end
end