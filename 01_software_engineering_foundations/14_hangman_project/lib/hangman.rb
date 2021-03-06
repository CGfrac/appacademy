class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index { |secret_char, index| indices << index if char == secret_char }
    indices
  end

  def fill_indices(char, indices)
    indices.each { |index| @guess_word[index] = char }
  end

  def try_guess(char)
    if self.already_attempted?(char)
      p "that has already been attempted"
      return false
    end
    
    @attempted_chars << char

    indices = self.get_matching_indices(char)
    self.fill_indices(char, indices)

    @remaining_incorrect_guesses -= 1 if indices.empty?
    
    true
  end

  def ask_user_for_guess
    p "Enter a char:"
    self.try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join == @secret_word
      p "WIN"
      return true
    end

    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    end

    false
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    end

    false
  end
end
