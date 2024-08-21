module BeerSong
  # @return [String] second to last verse of the song
  SECOND_TO_LAST_VERSE =
    "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"

  # @return [String] last verse of the song
  LAST_VERSE =
    "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"

  # Returns the lyrics to "99 Bottles of Beer on the Wall"
  # from a given starting point to a given ending point.
  # @param from [Integer] the starting point
  # @param take [Integer] the number of bottles to take down
  # @return [String] the lyrics
  def self.recite(from, take)
    current = from
    lines = []
    while take.positive?
      lines << verse(current)
      current -= 1
      take -= 1
    end
    lines.join("\n")
  end

  # Returns the verse of the song for a given number of bottles.
  # @param before [Integer] the number of bottles on the wall
  # @return [String] the verse
  def self.verse(before)
    after = before - 1

    if before > 1
      standard_verse(before, after)
    elsif before == 1
      SECOND_TO_LAST_VERSE
    else
      LAST_VERSE
    end
  end

  # Returns the standard verse of the song for a given number of bottles.
  # modifing the after variable to be singular if the number of bottles is 1.
  # @param before [Integer] the number of bottles on the wall
  # @param after [Integer] the number of bottles after taking one down
  # @return [String] the verse
  def self.standard_verse(before, after)
    after_bot = after == 1 ? "#{after} bottle" : "#{after} bottles"
    "#{before} bottles of beer on the wall, #{before} bottles of beer.\n" \
      "Take one down and pass it around, #{after_bot} of beer on the wall.\n"
  end
end
