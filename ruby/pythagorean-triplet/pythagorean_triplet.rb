module PythagoreanTriplet
  def self.triplets_with_sum(sum)
    (1..(sum / 3)).each_with_object([]) do |a, triples|
      b = (sum ** 2 - 2 * sum * a) / (2 * (sum - a))
      c = sum - a - b
      candidate = [a, b, c]
      triples.push(candidate) if triplet?(candidate)
    end
  end

  def self.triplet?(candidate)
    a, b, c = candidate
    a ** 2 + b ** 2 == c ** 2 && a < b && b < c
  end
end
