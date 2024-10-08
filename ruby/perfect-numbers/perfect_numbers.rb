module PerfectNumber
  def self.classify(number)
    raise "Number must be positive" if number < 1

    total = (1...number).sum { |n| (number % n).zero? ? n : 0 }

    if total < number
      "deficient"
    elsif total > number
      "abundant"
    else
      "perfect"
    end
  end
end
