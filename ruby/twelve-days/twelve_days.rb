module TwelveDays
  GIFT_RANGES = {
    'first' => 0..0,
    'second' => 0..1,
    'third' => 0..2,
    'fourth' => 0..3,
    'fifth' => 0..4,
    'sixth' => 0..5,
    'seventh' => 0..6,
    'eighth' => 0..7,
    'ninth' => 0..8,
    'tenth' => 0..9,
    'eleventh' => 0..10,
    'twelfth' => 0..11
  }.freeze

  GIFTS = [
    'and a Partridge in a Pear Tree',
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

  def self.song
    GIFT_RANGES.map do |day, range|
      gifts = "#{GIFTS[range].reverse.join(', ')}."
      gifts = day == 'first' ? gifts.gsub('and ', '') : gifts
      "On the #{day} day of Christmas my true love gave to me: #{gifts}\n"
    end.join("\n")
  end
end
