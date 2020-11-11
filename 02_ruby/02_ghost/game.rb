require_relative "player.rb"

class Game
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
end