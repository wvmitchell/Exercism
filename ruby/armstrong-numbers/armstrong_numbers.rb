module ArmstrongNumbers
  def self.include?(number)
    digits = number.digits
    length = digits.length
    number == digits.sum { |digit| digit**length }
  end
end
