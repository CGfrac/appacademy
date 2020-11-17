require_relative "board.rb"

class Game
    def initialize
        @board = Board.new
        @previous_guess = nil
    end
end