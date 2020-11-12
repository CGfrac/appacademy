require_relative "game.rb"

class AiPlayer < Player
    def guess(fragment, n)
        winning_moves = Hash.new(0)
        losing_moves = Hash.new(0)

        Game::ALPHABET.each do |char|
            candidate = fragment + char
            Game::DICTIONARY.each do |word|
                if word.start_with?(candidate)
                    distance = word.length - candidate.length
                    if distance > 1 && distance <= n
                        winning_moves[char] += 1
                    else
                        losing_moves[char] += 1
                    end
                end
            end
        end

        if winning_moves.length > 0
            candidates = winning_moves.keys
        else
            candidates = losing_moves.keys
        end

        strong_moves = []

        candidates.each do |char|
            if strong_moves.length > 0
                best = strong_moves[0]
            else
                strong_moves = [char]
                next
            end

            best_count = winning_moves[best] - losing_moves[best]
            count = winning_moves[char] - losing_moves[char]

            if best_count < count
                strong_moves = [char]
            elsif best_count == count
                strong_moves << char
            end
        end

        strong_moves.sample
    end
end