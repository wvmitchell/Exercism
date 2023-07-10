class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    case @speed
    when 5..8
      production = 198.9
    when 9
      production = 176.8
    when 10
      production = 170.17
    else
      production = 221.0
    end
    production * @speed
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
