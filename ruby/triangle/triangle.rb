class Triangle
  attr_reader :sides

  def initialize(sides)
    @side1, @side2, @side3 = sides
    @sides = sides
  end

  def equilateral?
    valid? && @sides.uniq.size == 1
  end

  def isosceles?
    valid? && @sides.uniq.size <= 2
  end

  def scalene?
    valid? && @sides.uniq.size == 3
  end

  def valid?
    sides.all?(&:positive?) &&
      sides.all? { |side| side < sides.sum - side }
  end
end
