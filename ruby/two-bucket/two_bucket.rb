class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(bucket_one_volume, bucket_two_volume, goal, start_bucket)
    @bucket_volumes = { one: bucket_one_volume, two: bucket_two_volume }
    @goal = goal
    @start_bucket = start_bucket
    @goal_state = calculate_moves
    @moves ||= @goal_state[2]
    @goal_bucket = @goal_state[0] == @goal ? "one" : "two"
    @other_bucket = @goal_state[0] == @goal ? @goal_state[1] : @goal_state[0]
  end

  def calculate_moves
    initial_state =
      (
        if @start_bucket == "one"
          [@bucket_volumes[:one], 0, 1]
        else
          [0, @bucket_volumes[:two], 1]
        end
      )
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
    bucket_one, bucket_two, moves = current_state
    next_states = []

    # Fill bucket one
    next_states.push([@bucket_volumes[:one], bucket_two, moves + 1])

    # Fill bucket two
    next_states.push([bucket_one, @bucket_volumes[:two], moves + 1])

    # Empty bucket one
    next_states.push([0, bucket_two, moves + 1])

    # Empty bucket two
    next_states.push([bucket_one, 0, moves + 1])

    # Pour from bucket one to bucket two
    pour = [bucket_one, bucket_two, moves + 1]
    pour[0] -= [@bucket_volumes[:two] - bucket_two, bucket_one].min
    pour[1] += [@bucket_volumes[:two] - bucket_two, bucket_one].min
    next_states.push(pour)

    # Pour from bucket two to bucket one
    pour = [bucket_one, bucket_two, moves + 1]
    pour[1] -= [@bucket_volumes[:one] - bucket_one, bucket_two].min
    pour[0] += [@bucket_volumes[:one] - bucket_one, bucket_two].min
    next_states.push(pour)

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
