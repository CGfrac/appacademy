require_relative "card.rb"

class Board
    def initialize
        @grid = Array.new(4) { Array.new(4) }
        self.populate
    end

    def [](*pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(*pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def populate
        alphabet = ('A'..'Z').to_a.shuffle!

        selection = alphabet[0...@grid.length * 2]
        selection += selection
        selection.shuffle!

        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                self[row,col] = Card.new(selection.pop)
            end
        end
    end

    def render
        system("clear")
        print "  "
        (0...@grid.length).each { |i| print i.to_s.ljust(2) }
        puts

        @grid.each.with_index do |row, index|
            print index.to_s.ljust(2)
            row.each.with_index do |card|
                if card.face_up
                    print card.to_s.ljust(2)
                else
                    print "  "
                end
            end
            puts
        end
    end

    def won?
        @grid.all? { |row| row.all? { |card| card.face_up } }
    end

    def reveal(guessed_pos)
        row, col = guessed_pos
        card = self[row,col]
        unless card.face_up
            card.reveal
            card.to_s
        end
    end
end