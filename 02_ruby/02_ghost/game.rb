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

    def take_turn(player)
        while true
            print "Type a character, #{player.name}: "
            char = player.guess
            if char.length == 1 && self.valid_play?(char)
                @fragment += char
                return @dictionary.include?(@fragment)
            else
                player.alert_invalid_guess
            end
        end
    end

    def play_round
        puts "Fragment: #{@fragment}"
        if self.take_turn(self.current_player)
            puts "#{self.previous_player.name} loses"
        end
        self.next_player!
    end
end