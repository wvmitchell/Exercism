class Palindromes
  def initialize(max_factor: 0, min_factor: 1)
    @max = max_factor
    @min = min_factor
  end

  def generate
    candidates = (@min..@max).each_with_object([]) do |i, factors|
      (@min..@max).each do |j|
        factors << i * j
      end
    end

    @generate ||= candidates
                  .select { |factor| factor.to_s == factor.to_s.reverse }
                  .map { |factor| Palindrome.new(factor, max: @max, min: @min) }
  end

  def largest
    @largest ||= @generate.last
  end

  def smallest
    @smallest ||= @generate.first
  end
end

class Palindrome
  attr_reader :value

  def initialize(value, max: 0, min: 1)
    @value = value
    @max = max
    @min = min
  end

  def factors
    (@min..@value).each_with_object([]) do |i, factors|
      factor = [i, @value / i].sort

      next unless (@value % i).zero? &&
                  !factors.include?(factor) &&
                  factor.all? { |f| f >= @min && f <= @max }

      factors << factor
    end
  end
end
