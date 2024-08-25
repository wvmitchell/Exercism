class Series
  # @!attribute [r] digits
  # @return [Array<Integer>] the digits of the series
  attr_reader :digits

  # Initializes a new Series object with a string of digits.
  # @param value [String] the string of digits
  def initialize(value)
    raise ArgumentError if value.match?(/[^0-9]/)

    @digits = value.split("").map(&:to_i)
  end

  # largest_product returns the largest product of a span of
  # digit_span by taking simply recalculating the product for
  # each slice of the series.
  # @param span [Integer] the number of digits to consider
  # @return [Integer] the largest product of the span of digits
  def largest_product(span)
    raise ArgumentError if span > digits.length || span.negative?

    max_product = 0

    digits.each_cons(span) do |digit_span|
      product = digit_span.inject(:*)
      max_product = product if product > max_product
    end

    max_product
  end
end
