module Luhn
  def self.valid?(str)
    str.reverse!.gsub!(/\s/, '')
    return false if str.match(/\W|[a-zA-Z]/) || str.length < 2
    total = str.chars.each_with_index.reduce(0) do |sum, (char, i)|
      raw = char.to_i
      value = i.odd? ? raw * 2 : raw
      sum + (value > 9 ? value - 9 : value)
    end
    total % 10 === 0
  end
end
