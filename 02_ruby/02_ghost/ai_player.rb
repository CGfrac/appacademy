require_relative "game.rb"

class AiPlayer < Player
    def guess(fragment, n)
        winning_moves = []
        losing_moves = []

        Game::ALPHABET.each do |char|
            candidate = fragment + char
            Game::DICTIONARY.each do |word|
                if word.start_with?(candidate)
                    distance = word.length - candidate.length
                    if distance > 1 && distance <= n
                        winning_moves << char
                    else
                        losing_moves << char
                    end
                end
            end
        end

        if winning_moves.length > 0
            winning_moves.sample
        else
            losing_moves.sample
        end
    end
end