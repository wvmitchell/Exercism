class TwoBucket
  attr_reader :primary,
              :secondary,
              :desired_liters,
              :goal_bucket, 
              :other_bucket,
              :buckets,
              :moves

  def initialize(volume_one, volume_two, desired_liters, start)
    @moves = 0
    @buckets = {
      "one" => {current: 0, volume: volume_one},
      "two" => {current: 0, volume: volume_two}
    }
    @primary = @buckets[start]
    @secondary = start === "one" ? @buckets["two"] : @buckets["one"]
    @desired_liters = desired_liters
    calculate
  end

  private

  def calculate
    while(!goal_reached?)
      if empty?(primary)
        fill(primary)
      elsif full?(primary) && secondary[:volume] == desired_liters
        fill(secondary)
      elsif full?(primary)
        dump(primary, secondary)
      elsif full?(secondary)
        dump(secondary)
      else
        dump(primary, secondary)
      end
      @moves += 1
    end
  end

  def goal_reached?
    goal_bucket, other_content = find_goal_bucket_and_other_bucket_content_content
  
    if goal_bucket
      set_goal_and_other_bucket_content(goal_bucket, other_content)
      true
    else
      false
    end
  end

  def find_goal_bucket_and_other_bucket_content_content
    num, _ = buckets.find do |name, bucket|
      bucket[:current] == desired_liters
    end
    other = num == "one" ? buckets["two"][:current] : buckets["one"][:current]
    [num, other]
  end
  
  def set_goal_and_other_bucket_content(goal, other_content)
    @goal_bucket = goal
    @other_bucket = other_content
  end

  def full?(bucket)
    bucket[:current] === bucket[:volume]
  end

  def empty?(bucket)
    bucket[:current] === 0
  end

  def fill(bucket)
    bucket[:current] = bucket[:volume]
  end

  def dump(from, to = nil)
    if to
      to[:current] += from[:current]

      if to[:current] > to[:volume]
        from[:current] = to[:current] - to[:volume]
        to[:current] = to[:volume]
      else
        from[:current] = 0
      end
    else
      from[:current] = 0
    end
  end
end
