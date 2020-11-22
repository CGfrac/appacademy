require_relative "card.rb"

class Board
    def initialize(size, bombs=false)
        @grid = Array.new(size) { Array.new(size) }
        self.populate(bombs)
    end

    def [](*pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(*pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def set_bombs(alphabet)
        up_to = @grid.length / 2
        (0...up_to).each { |idx| alphabet[idx] = '*' }
    end

    def populate(bombs)
        alphabet = ('A'..'Z').to_a.shuffle!
        
        self.set_bombs(alphabet) if bombs

        slice = (@grid.length * @grid.length) / 2
        selection = alphabet[0...slice]
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
        card.reveal unless card.face_up
        card.to_s
    end
end