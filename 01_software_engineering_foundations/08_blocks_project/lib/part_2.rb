def all_words_capitalized?(arr)
    arr.all? { |word| word == word.capitalize }
end

def no_valid_url?(arr)
    valid_urls = ["com", "net", "io", "org"]
    arr.none? { |url| valid_urls.include?(url.split(".")[-1]) }
end