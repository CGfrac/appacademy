class Game
    def initialize
        @players = []
        @fragment = ""
        @dictionary = File.read("dictionary.txt").split.to_set
    end
end