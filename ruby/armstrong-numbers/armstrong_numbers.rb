module ArmstrongNumbers
  def self.include?(number)
    chars = number.to_s.chars
    length = chars.length
    number == chars.reduce(0) { |sum, char| sum + char.to_i**length }
  end
end
