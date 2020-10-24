class Board
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](pos)
    row = pos[0]
    col = pos[1]
    @grid[row][col]
  end

  def []=(pos, value)
    row = pos[0]
    col = pos[1]
    @grid[row][col] = value
  end

  def num_ships
    count = 0
    @grid.each { |row| count += row.count(:S) }
    count
  end

  def attack(pos)
    if self[pos] == :S
        self[pos] = :H
        puts "you sunk my battleship!"
        return true
    else
        self[pos] = :X
        return false
    end
  end
end
