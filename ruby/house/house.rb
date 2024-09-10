module House
  HOUSE_ATTRIBUTES = {
    "malt" => "lay in the",
    "rat" => "ate the",
    "cat" => "killed the",
    "dog" => "worried the",
    "cow with the crumpled horn" => "tossed the",
    "maiden all forlorn" => "milked the",
    "man all tattered and torn" => "kissed the",
    "priest all shaven and shorn" => "married the",
    "rooster that crowed in the morn" => "woke the",
    "farmer sowing his corn" => "kept the",
    "horse and the hound and the horn" => "belonged to the"
  }.freeze

  def self.recite
    verse = 0
    rhyme = ""
    while verse <= HOUSE_ATTRIBUTES.length
      rhyme << build_verse(verse)
      rhyme << "\n" unless verse == HOUSE_ATTRIBUTES.length
      verse += 1
    end
    rhyme
  end

  def self.build_verse(verse)
    start = "This is the"
    round =
      HOUSE_ATTRIBUTES
      .first(verse)
      .reverse
      .map
      .with_index do |(element, action), _index|
        " #{element}\nthat #{action}"
      end
        .join("")
    finish = " house that Jack built."
    "#{start}#{round}#{finish}\n"
  end
end
