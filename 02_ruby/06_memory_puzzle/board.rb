require_relative "card.rb"

class Board
    attr_reader :bombs

    def initialize(height, width, match_num, bombs=false)
        @height = height
        @width = width
        @grid = Array.new(@height) { Array.new(@width) }
        @match_num = match_num
        @bombs = []
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

    def select_card_values(alphabet)
        slice_size = (@height * @width) / @match_num
        slice = alphabet[0...slice_size]
        selection = []
        @match_num.times { selection += slice }
        selection.shuffle
    end

    def populate(bombs)
        alphabet = ('A'..'Z').to_a.shuffle!
        self.set_bombs(alphabet) if bombs
        selection = self.select_card_values(alphabet)

        (0...@height).each do |row|
            (0...@width).each do |col|
                @bombs << [row,col] if selection[-1] == '*'
                self[row,col] = Card.new(selection.pop)
            end
        end
    end

    def render
        system("clear")
        print "  "
        (0...@width).each { |i| print i.to_s.ljust(2) }
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
        @grid.all? { |row| row.all? { |card| card.face_up || card.to_s == '*' } }
    end

    def reveal_bombs
        @bombs.each { |row, col| self[row,col].reveal }
    end

    def hide_bombs
        @bombs.each { |row, col| self[row,col].hide }
    end

    def reveal(guessed_pos)
        row, col = guessed_pos
        card = self[row,col]
        card.reveal unless card.face_up
        card.to_s
    end
end