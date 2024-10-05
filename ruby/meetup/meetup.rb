class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day, type)
    case type
    when :teenth
      first_in_range(day, (13..19))
    when :first
      first_in_range(day, (1..7))
    when :second
      first_in_range(day, (8..14))
    when :third
      first_in_range(day, (15..21))
    when :fourth
      first_in_range(day, (22..28))
    when :last
      last_of_day(day)
    end
  end

  def first_in_range(day, range)
    range.each do |day_num|
      date = Date.new(@year, @month, day_num)
      return date if date.send("#{day}?")
    end
  end

  def last_of_day(day)
    date = Date.new(@year, @month, -1)
    date.downto(date - 6) { |d| return d if d.send("#{day}?") }
  end
end
