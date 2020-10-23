require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(guess)
    puts "Exact matches: #{@secret_code.num_exact_matches(guess)}"
    puts "Near matches: #{@secret_code.num_near_matches(guess)}"
  end
end
