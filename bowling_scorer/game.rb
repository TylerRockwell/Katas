require_relative 'frame'
require 'byebug'
class Game
  attr_reader :frame

  def initialize
    @frames = []
    @frame_max = 10
    @rolls = []
    advance_frame
  end

  def roll(pins_knocked_down)
    @rolls << pins_knocked_down
    current_frame.add_roll(@rolls[-1])
    advance_frame if current_frame.complete?
  end

  def current_frame
    @frames[-1]
  end

  def current_frame_number
    @frames.count
  end

  def tenth_frame?
    @frames.count == 10
  end

  def advance_frame
    # if current_frame_number >= @frame_max
    #   end_game unless tenth_frame? && (current_frame.score_type == 'strike' || current_frame.score_type == 'spare')
    # end
      @frames << Frame.new(@rolls.count)
  end

  def score
    score = @frames.inject(0){ |sum, frame| sum += frame.score }
    score + bonus_score
  end

  def bonus_score
    # This method is slightly less bad.
    bonus = 0
    @frames.each_with_index do |frame, index|
      unless last_frame?(index)
        if frame.score_type == 'strike'
          bonus += next_two_rolls(frame)
        elsif frame.score_type == 'spare'
          bonus += next_roll(frame)
        end
      end
    end
    bonus
  end

  def last_frame?(index)
    index > 8
  end

  def next_two_rolls(frame)
    begin
      @rolls[frame.game_rolls_index+1] + @rolls[frame.game_rolls_index+2]
    rescue
      byebug
    end
  end

  def next_roll(frame)
    @rolls[frame.game_rolls_index+2]
  end

  def end_game
    puts "Your score for this game was #{score}"
  end
end
