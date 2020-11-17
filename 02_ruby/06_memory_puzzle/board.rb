require_relative "card.rb"

class Board
    def initialize
        @grid = Array.new(4) { Array.new(4) }
    end

    def populate
        alphabet = ('A'..'Z').to_a.shuffle!

        selection = alphabet[0...@grid.length * 2]
        selection += selection
        selection.shuffle!

        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                @grid[i][j] = Card.new(selection.pop)
            end
        end
    end

    def render
        @grid.each do |row|
            row.each do |card| 
                if card.face_up
                    print card.to_s
                else
                    print " "
                end
            end
            puts
        end
    end
end