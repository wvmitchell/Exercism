CODES = {
  black: 0,
  brown: 1,
  red: 2,
  orange: 3,
  yellow: 4,
  green: 5,
  blue: 6,
  violet: 7,
  grey: 8,
  white: 9
}.freeze

module ResistorColorDuo
  def value(colors)
    tens, units = colors.map { |c| CODES[c.to_sym] }
    tens * 10 + units
  end

  module_function :value
end
