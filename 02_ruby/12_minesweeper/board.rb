require "set"
require_relative "tile.rb"

class Board
    def initialize
        @grid = Array.new(9) { Array.new(9) }
        populate_grid
    end

    def set_bomb_coords
        bombs = Set.new
        while bombs.length < 12
            bombs << [rand(0...9), rand(0...9)]
        end
        bombs
    end
end