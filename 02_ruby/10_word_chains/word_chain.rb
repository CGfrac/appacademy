require "set"

class WordChainer
    ALPHABET = ('a'..'z').to_a

    def initialize(dictionary_file_name)
        @dictionary = File.read(dictionary_file_name).split.to_set
    end

    def adjacent_words(word)
        adjacent = []

        (0...word.length).each do |i|
            candidate = word[0..-1]

            ALPHABET.each do |char|
                candidate[i] = char
                if @dictionary.include?(candidate) && candidate != word
                    adjacent << candidate[0..-1]
                end
            end
        end

        adjacent
    end
end