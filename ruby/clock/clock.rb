class Clock
  attr_reader :total_minutes

  def initialize(hour: 0, minute: 0)
    @total_minutes = hour * 60 + minute
  end

  def hour = ((total_minutes / 60) % 24).to_s.rjust(2, '0')

  def minute = (total_minutes % 60).to_s.rjust(2, '0')

  def to_s
    "#{hour}:#{minute}"
  end

  def +(other)
    @total_minutes += other.total_minutes
    self
  end

  def -(other)
    @total_minutes -= other.total_minutes
    self
  end

  def ==(other)
    to_s == other.to_s
  end
end
