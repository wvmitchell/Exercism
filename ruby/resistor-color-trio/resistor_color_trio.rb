class ResistorColorTrio
  def initialize(colors)
    @colors = colors
    @ohms = calculate_ohms
  end

  def label
    "Resistor value: #{format_ohms}"
  end

  private

  def calculate_ohms
    tens = COLOR_CODES[@colors[0]] * 10
    units = COLOR_CODES[@colors[1]]
    multiplier = 10 ** COLOR_CODES[@colors[2]]
    (tens + units) * multiplier
  end

  def format_ohms
    if @ohms < 1000
      "#{@ohms} ohms"
    else
      "#{@ohms / 1000} kiloohms"
    end
  end

  COLOR_CODES = {
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9
  }.freeze
end
