require "set"
require_relative "player.rb"
require_relative "ai_player.rb"

class Game
    ALPHABET = ('a'..'z').to_a
    DICTIONARY = File.read("dictionary.txt").split.to_set
    GHOST = "GHOST"

    def initialize(players={"Player1"=>false, "Player2"=>false})
        @players = []
        players.each do |name, ai_player|
            if ai_player
                @players << AiPlayer.new(name)
            else
                @players << Player.new(name)
            end
        end
        @losses = Hash.new(0)
        @fragment = ""
    end

    def number_players
        @players.length
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
        ALPHABET.include?(char) && DICTIONARY.any? { |word| word.start_with?(@fragment + char) }
    end

    def take_turn(player)
        while true
            print "Type a character, #{player.name}: "

            if player.is_a?(AiPlayer)
                char = player.guess(@fragment, self.number_players)
                puts
            else
                char = player.guess
            end

            if char.length == 1 && self.valid_play?(char)
                @fragment += char
                puts "Fragment: #{@fragment}"
                return DICTIONARY.include?(@fragment)
            else
                player.alert_invalid_guess
            end
        end
    end

    def play_round
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
        @players.each do |player|
            puts "#{player.name}".ljust(15) + " | " + self.record(player)
        end
        puts hr
    end

    def run
        while self.number_players > 1
            while @losses[self.previous_player] < 5
                self.display_standings
                @fragment = ""
                self.next_player! until self.play_round
                DICTIONARY.delete(@fragment)
            end
            puts "#{self.previous_player.name} is a GHOST!"
            @players.pop
        end
        puts "#{self.current_player.name} is the last player standing!"
    end
end

if __FILE__ == $PROGRAM_NAME
    players = {}
    i = 1
    while true
        print "Type player #{i} name: "
        name = gets.chomp
        print "It's an AI? (type 'y' to confirm): "
        ai = gets.chomp.downcase
        players[name] = (ai == 'y')

        if i >= 2
            print "Add another player? (type 'y' to accept): "
            yes_no = gets.chomp.downcase
            break if yes_no != "y"
        end

        i += 1
    end
    game = Game.new(players)
    game.run
end