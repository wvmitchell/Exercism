class Game
  attr_reader :frames

  def initialize
    @frames = []
  end

  def roll(pins)
    validate_roll(pins, frames[-1])

    if frame_in_progress?
      frames[-1].push(pins)
    else
      frames.push([pins])
    end
  end

  def score
    validate_game

    frames.each_with_index.inject(0) do |total, (frame, index)|
      if is_bonus_frame?(index)
        total
      elsif is_spare?(frame)
        total + frame.inject(0, :+) + next_roll_value(index)
      elsif is_strike?(frame)
        total + frame.inject(0, :+) + next_2_rolls_value(index)
      else
        total + frame.inject(0, :+)
      end
    end
  end

  private

  def frame_in_progress?
    frames[-1] &&
    frames[-1].inject(0, :+) < 10 && 
    frames[-1].length < 2
  end

  def is_spare?(frame)
    frame.length == 2 && frame.inject(0, :+) === 10
  end

  def is_strike?(frame)
    frame[0] === 10
  end

  def next_roll_value(from)
    next_frame = frames[from + 1]
    next_frame[0]
  end

  def next_2_rolls_value(from)
    next_two_frames = frames[(from + 1)..(from + 2)]
    next_several_rolls = next_two_frames.flatten
    next_several_rolls[0] + next_several_rolls[1]
  end

  def is_bonus_frame?(frame_index)
    frame_index >= 10
  end

  def complete_game?
    complete_with_open_frame? ||
    complete_with_spare_bonus? ||
    complete_with_strike_bonus?
  end

  def complete_with_open_frame?
    frames.length == 10 &&
    frames[-1].length == 2 &&
    frames[-1].inject(:+) < 10
  end

  def complete_with_spare_bonus?
    frames[9] &&
    frames[9].length == 2 &&
    frames[9].inject(0, :+) == 10 &&
    frames[10] &&
    frames[10].length == 1
  end

  def complete_with_strike_bonus?
    frames[9] &&
    frames[9].length == 1 &&
    frames[9][0] == 10 &&
    frames[10] &&
    (frames[10].length == 2 ||
     (frames[10][0] == 10 &&
      frames[11] &&
      frames[11].length == 1
     )
    )
  end

  def validate_roll(pins, currentFrame)
    raise BowlingError if pins < 0 || pins > 10
    if frame_in_progress?
      raise BowlingError if pins + currentFrame[0] > 10
    end
    raise BowlingError if complete_game?
  end

  def validate_game
    raise BowlingError if frames.length < 10
    raise BowlingError if !complete_game?
  end

  class BowlingError < StandardError
  end
end
