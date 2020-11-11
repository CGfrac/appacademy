require "set"
require_relative "player.rb"

class Game
    ALPHABET = ('a'..'z').to_a
    GHOST = "GHOST"

    def initialize(player_names=["Player1", "Player2"])
        @players = []
        player_names.each { |name| @players << Player.new(name) }
        @losses = {}
        @players.each { |player| @losses[player] = 0 }
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
            return true
        else
            return false
        end
    end

    def record(player)
        GHOST[0...@losses[player]]
    end

    def display_standings
        hr = "-" * 25
        puts hr
        puts "Player".ljust(15) + " | " + "Losses"
        puts hr
        @losses.each do |player, count|
            puts "#{player.name}".ljust(15) + " | " + self.record(player)
        end
        puts hr
    end

    def run
        while @players.length > 1
            while @losses[self.previous_player] < 5
                self.display_standings
                @fragment = ""
                self.next_player! until self.play_round
            end
            puts "#{self.previous_player.name} is a GHOST!"
            @players.pop
        end
        puts "#{self.current_player.name} is the last person standing!"
    end
end

if __FILE__ == $PROGRAM_NAME
    names = []
    i = 1
    while true
        puts "Type player #{i} name: "
        names << gets.chomp
        if i >= 2
            puts "Add another player? (type 'y'): "
            yes_no = gets.chomp.downcase
            break if yes_no != "y"
        end
        i += 1
    end
    game = Game.new(names)
    game.run
end