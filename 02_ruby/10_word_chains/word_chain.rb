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

    def explore_current_words
        new_current_words = []

            @current_words.each do |word|
                self.adjacent_words(word).each do |adjacent|
                    if @all_seen_words.include?(adjacent)
                        next
                    else
                        new_current_words << adjacent
                        @all_seen_words[adjacent] = word
                    end
                end
            end
        
        @current_words = new_current_words
    end

    def build_path(target)
        path = [target]
        word = target

        while @all_seen_words[word]
            word = @all_seen_words[word]
            path.unshift(word)
        end

        path
    end

    def run(source, target)
        @current_words = [source]
        @all_seen_words = { source => nil }

        while @current_words.length > 0
            self.explore_current_words
            break if @all_seen_words.include?(target)
        end

        build_path(target)
    end
end