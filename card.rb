class Card
  attr_reader :face_down_value, :face_down, :face_value

  def initialize
    @face_value = ("A".."Z").to_a.sample
    @face_down = true
    @face_down_value = "_"
  end

  def hide
    @face_down = true
    @face_down_value
  end

  def display
    @face_down = false
    @face_value
  end
end
