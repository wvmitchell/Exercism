module IsbnVerifier
  def self.valid?(string)
    number_chars = string.gsub(/[^0-9|A-Z]/,'').chars
    return false if invalid_chars?(number_chars)

    multipliers = (1..10).to_a.reverse
    zipped = number_chars.zip(multipliers)

    final = zipped.reduce(0) do |total, pair|
      char, multiplier = pair
      val = char == 'X' ? 10 : char.to_i
      total + val * multiplier
    end

    final % 11 == 0
  end

  def self.invalid_chars?(chars)
    if chars.length != 10
      true
    elsif chars.any?(/[A-W|Y-Z]/)
      true
    elsif chars.one?('X') && chars.last != 'X'
      true
    end
  end
end
