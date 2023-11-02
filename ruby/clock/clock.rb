class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    extra_hour, @minute = minute.divmod(60)
    @hour = (hour + extra_hour) % 24
  end

  def to_s
    "#{@hour.to_s.rjust(2, '0')}:#{@minute.to_s.rjust(2, '0')}"
  end

  def +(other)
    Clock.new(
      hour: @hour + other.hour,
      minute: @minute + other.minute
    )
  end

  def -(other)
    Clock.new(
      hour: @hour - other.hour,
      minute: @minute - other.minute
    )
  end

  def ==(other)
    @hour == other.hour && @minute == other.minute
  end
end
