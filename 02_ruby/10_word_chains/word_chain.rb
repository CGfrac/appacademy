require "set"

class WordChainer
    def initialize(dictionary_file_name)
        @dictionary = File.open(dictionary_file_name).split.to_set
    end
end