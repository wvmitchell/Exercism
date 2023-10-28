# typed: strict

RESISTOR_CODES = T.let({
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
}.freeze, T::Hash[T.untyped, T.untyped])

class ResistorColorTrio
  extend T::Sig

  sig { params(colors: T::Array[String]).void }
  def initialize(colors)
    @ohms = T.let(calculate_ohms(colors), Integer)
  end

  sig { returns(String) }
  def label
    if @ohms >= 1000
      "Resistor value: #{@ohms / 1000} kiloohms"
    else
      "Resistor value: #{@ohms} ohms"
    end
  end

  private

  def calculate_ohms(colors)
    tens = RESISTOR_CODES[T.must(colors[1]).to_sym] * 10
    units = RESISTOR_CODES[T.must(colors[1]).to_sym]
    factor = 10**RESISTOR_CODES[T.must(colors[2]).to_sym]
    (tens + units) * factor
  end
end
