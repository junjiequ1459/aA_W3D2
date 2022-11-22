require_relative "card"

class Board
  def initialize
    @grid = Array.new(4) { Array.new(4) { 0 } }
  end

  def [](pos)
    row, col = [pos]
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = [pos]
    @grid[row][col] = val
  end

  def populate
    @grid.each_with_index do |row, i|
      row.each_with_index do |e, j|
        if i < @grid.length / 2
          @grid[i][j] = Card.new
          @grid[i + 2][j] = @grid[i][j]
        end
      end
    end
  end

  def render
  end
end
