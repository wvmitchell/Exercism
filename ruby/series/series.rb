class Series
  attr_reader :digits

  def initialize(digits)
    @digits = digits
  end

  def slices(length)
    raise ArgumentError if length > digits.size || length <= 0

    digits.scan(/(?=(\d{#{length}}))/).flatten
  end
end
