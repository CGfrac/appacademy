require_relative "player.rb"

class Game
    ALPHABET = ('a'..'z').to_a
    GHOST = "GHOST"

    def initialize
        @players = [Player.new("PLAYER1"), Player.new("PLAYER2")]
        @losses = Hash.new(0)
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
            @losses[self.previous_player] += 1
        end
        self.next_player!
    end

    def record(player)
        GHOST[0...@losses[player]]
    end

    def display_standings
        @losses.each do |player, count|
            puts "#{player.name}".ljust(15) + self.record(player)
        end
    end
end