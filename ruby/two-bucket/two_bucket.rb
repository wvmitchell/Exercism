class Bucket
  attr_accessor :current_volume

  def initialize(volume)
    @volume = volume
    @current_volume = 0
  end

  def fill
    @current_volume = @volume
  end

  def empty
    @current_volume = 0
  end

  def pour_into(other_bucket)
    volume_to_pour = [@current_volume, other_bucket.remaining_volume].min
    @current_volume -= volume_to_pour
    other_bucket.current_volume += volume_to_pour
    [self, other_bucket]
  end

  def copy
    Bucket.new(@volume).tap { |bucket| bucket.current_volume = @current_volume }
  end

  def remaining_volume
    @volume - @current_volume
  end
end

class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(bucket_one_volume, bucket_two_volume, goal, start_bucket)
    @goal = goal
    @start_bucket = start_bucket
    @start_state = [
      Bucket.new(bucket_one_volume),
      Bucket.new(bucket_two_volume),
      0
    ]
    @goal_state = calculate_moves
    @moves ||= @goal_state[2]
    @goal_bucket = @goal_state[0] == @goal ? "one" : "two"
    @other_bucket = @goal_state[0] == @goal ? @goal_state[1] : @goal_state[0]
  end

  def calculate_moves
    @start_bucket == "one" ? @start_state[0].fill : @start_state[1].fill
    initial_state = [@start_state[0].copy, @start_state[1].copy, 1]
    queue = [initial_state]
    visited_states = Set.new

    until queue.empty?
      current_state = queue.shift

      return current_state if current_state[0] == @goal || current_state[1] == @goal

      visited_states.add(current_state[..1])
      next_states = next_states(current_state)

      next_states.each do |state|
        queue.push(state) unless visited_states.include?(state[..1]) || !valid_state?(state)
      end
    end
  end

  def next_states(current_state)
    next_states = []
    number_of_moves = current_state[2] + 1
    next_states.push(
      current_state[0].copy.fill,
      current_state[1].copy,
      number_of_moves
    )
    next_states.push(
      current_state[0].copy.empty,
      current_state[1].copy,
      number_of_moves
    )
    next_states.push(
      current_state[0].copy,
      current_state[1].copy.fill,
      number_of_moves
    )
    next_states.push(
      current_state[0].copy,
      current_state[1].copy.empty,
      number_of_moves
    )
    next_states.push(
      current_state[0].copy.pour_into(current_state[1].copy) + [number_of_moves]
    )
    next_states.push(
      current_state[1].copy.pour_into(current_state[0].copy) + [number_of_moves]
    )
    next_states
  end

  def valid_state?(state)
    if @start_bucket == "one"
      state[0].positive? || state[1] < @bucket_volumes[:two]
    else
      state[0] < @bucket_volumes[:one] || state[1].positive?
    end
  end
end
