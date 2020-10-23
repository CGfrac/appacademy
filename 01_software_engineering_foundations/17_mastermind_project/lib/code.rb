class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise "Invalid peg(s)"
    end
  end

  def self.random(length)
    chars = []
    length.times { chars << POSSIBLE_PEGS.keys.sample }
    Code.new(chars)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    matches = 0
    guess.pegs.each_with_index { |char, idx| matches += 1 if char == @pegs[idx] }
    matches
  end

  def num_near_matches(guess)
    matches = 0
    guess.pegs.each_with_index { |char, idx| matches += 1 if char != @pegs[idx] && @pegs.include?(char) }
    matches
  end

  def ==(guess)
    self.length == guess.length && guess.pegs == @pegs 
  end
end
