class Frame

  PINS_MAX = 10

  attr_reader :score_type, :game_rolls_index

  def initialize(game_rolls_index)
    @rolls = []
    @roll_max = 2
    @complete = false
    @score_type = "regular"
    @game_rolls_index = game_rolls_index
  end

  def add_roll(pins_knocked_down)
    # Come back to refactor this method
    @rolls << pins_knocked_down
    @complete = true if @rolls.count == @roll_max
    if score == PINS_MAX
      @score_type = set_score_type
      @complete = true
    end
  end

  def complete?
    @complete
  end

  def score
    @rolls.inject(:+) || 0
  end

  def set_score_type
    @rolls.count == 1 ? "strike" : "spare"
  end
end
