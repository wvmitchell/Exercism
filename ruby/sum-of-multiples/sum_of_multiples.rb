class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(value)
    (1...value).select { |n| @factors.any? { |f| (n % f).zero? } }.sum
  end
end
