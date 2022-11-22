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
    shuffled = @grid.flatten.shuffle
    @grid.each_with_index do |row, i|
      row.each_with_index do |ele, j|
        @grid[i][j] = shuffled[i + j]
      end
    end
  end

  def render
    @grid.each do |row|
      puts row.map(&:face_down_value).join(" ")
    end
  end

  def won?
    @grid.each do |row|
      row.each do |ele|
        if ele.face_down == true
          return false
        end
      end
    end
    true
  end

  def reveal(guessed_pos)
    row, col = guessed_pos
    if @face_down == true
      @grid[row][col].reveal
    end
  end
end
