require_relative "board"
require_relative "player"
require_relative "card"

class Game
  def initialize
    @board = Board.new
    @player = Player.new
    @current_guess = []
    @previous_guess = []
  end

  def first_guess(pos)
    @previous_guess = pos
    @board.grid[@previous_guess].display
  end

  def second_guess(pos)
    @current_guess = pos
    if @current_guess == @previous_guess
      @board.grid[@current_guess].display
      current_guess = []
      previous_guess = []
    else
      @board.grid[@current_guess].hide
      @board.grid[@current_guess].hide
      current_guess = []
      previous_guess = []
    end
  end

  def play?
    @board.populate
    while !@board.won?
      @board.render
      pos = @player.get_input
      self.first_guess(pos)
      #render
      self.second_guess(pos)
      #render
    end
    p "game over"
  end
end

game = Game.new

game.play?
