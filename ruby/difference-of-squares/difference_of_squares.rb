class Squares
  attr_reader :up_to

  def initialize(up_to)
    @up_to = up_to
  end

  def square_of_sum
    ((up_to / 2.0) * (1 + up_to))**2
  end

  def sum_of_squares
    (up_to * (up_to + 1) * (2 * up_to + 1)) / 6
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
