class AssemblyLine
  BASE_RATE_PER_HOUR = 221.0

  def initialize(speed)
    @speed = speed
    @success_rate = determine_success_rate
  end

  def production_rate_per_hour
    BASE_RATE_PER_HOUR * @speed * @success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end

  def determine_success_rate
    case @speed
    when 1..4
      1
    when 4..8
      0.9
    when 9
      0.8
    when 10
      0.77
    end
  end
end
