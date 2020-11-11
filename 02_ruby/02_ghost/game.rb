require_relative "player.rb"

class Game
    ALPHABET = ('a'..'z').to_a

    def initialize
        @players = [Player.new("PLAYER1"), Player.new("PLAYER2")]
        @fragment = ""
        @dictionary = File.read("dictionary.txt").split.to_set
    end

    def current_player
        @players[0]
    end

    def previous_player
        @players[-1]
    end

    def next_player!
        @players.rotate!
    end

    def valid_play?(char)
        ALPHABET.include?(char) && @dictionary.any? { |word| word.include?(@fragment + char) }
    end
end