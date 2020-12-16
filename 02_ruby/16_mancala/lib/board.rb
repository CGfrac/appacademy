class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...@cups.length).each { |index| @cups[index] = [:stone] * 4 unless index == 6 || index == 13 }
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0,5) || start_pos.between?(7,12)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    holding = @cups[start_pos]
    @cups[start_pos] = []

    pos = start_pos
    until holding.empty?
      pos = (pos + 1) % 14
      unless (current_player_name == @name1 && pos == 13 || 
              current_player_name == @name2 && pos == 6)
        @cups[pos] << holding.pop
      end
    end

    self.render
    self.next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
