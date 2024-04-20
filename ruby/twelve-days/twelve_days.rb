module TwelveDays
  GIFT_STATEMENTS = [
    'a Partridge in a Pear Tree.',
    'two Turtle Doves',
    'three French Hens',
    'four Calling Birds',
    'five Gold Rings',
    'six Geese-a-Laying',
    'seven Swans-a-Swimming',
    'eight Maids-a-Milking',
    'nine Ladies Dancing',
    'ten Lords-a-Leaping',
    'eleven Pipers Piping',
    'twelve Drummers Drumming'
  ].freeze

  GIFT_COUNTS = {
    first: 1,
    second: 2,
    third: 3,
    fourth: 4,
    fifth: 5,
    sixth: 6,
    seventh: 7,
    eighth: 8,
    ninth: 9,
    tenth: 10,
    eleventh: 11,
    twelfth: 12
  }.freeze

  def self.song
    lyrics = GIFT_COUNTS.map do |day, count|
      "On the #{day} day of Christmas my true love gave to me: #{gifts(count)}"
    end.join("\n\n")
    "#{lyrics}\n"
  end

  def self.gifts(count)
    if count < 2
      GIFT_STATEMENTS[0]
    else
      GIFT_STATEMENTS[1...count].reverse.join(', ') +
        ", and #{GIFT_STATEMENTS[0]}"
    end
  end
end
