module ResistorColorDuo
  COLOR_CODES = {
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

  def self.value(colors)
    colors[0..1]
      .map { |c| COLOR_CODES[c.to_sym] }
      .join('')
      .to_i
  end
end
