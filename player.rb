class Player
  def initialize
  end

  def get_input
    p "please enter a position such as 0 0"
    input = gets.chomp.split(" ").map(&:to_i)
  end
end
