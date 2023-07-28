module FoodChain
  extend self

  def standard_bridge(from, to)
    "She swallowed the #{from} to catch the #{to}."
  end

  def compile_bridges(from)
    animals = LYRICS.keys
    from_index = animals.index(from)
    required_animals = animals[0..from_index].reverse
    required_animals.reduce("") do |bridges, animal|
      bridges += "#{LYRICS[animal][:bridge]}\n"
    end
  end

  def song
    LYRICS.reduce("") do |text, (animal, lyrics)|
      text += "I know an old lady who swallowed a #{animal.to_s}.\n"
      text += "#{lyrics[:line]}\n" if lyrics[:line]
      text += "#{compile_bridges(animal)}\n" if lyrics[:bridge]
      text
    end
  end

  LYRICS = {
    fly: {
      line: nil,
      bridge: "I don't know why she swallowed the fly. Perhaps she'll die.",
    },
    spider: {
      line: "It wriggled and jiggled and tickled inside her.",
      bridge: standard_bridge("spider", "fly")
    },
    bird: {
      line: "How absurd to swallow a bird!",
      bridge: standard_bridge("bird", "spider")
              .gsub(".", " that wriggled and jiggled and tickled inside her.")
    },
    cat: {
      line: "Imagine that, to swallow a cat!",
      bridge: standard_bridge("cat", "bird"),
    },
    dog: {
      line: "What a hog, to swallow a dog!",
      bridge: standard_bridge("dog", "cat"),
    },
    goat: {
      line: "Just opened her throat and swallowed a goat!",
      bridge: standard_bridge("goat", "dog"),
    },
    cow: {
      line: "I don't know how she swallowed a cow!",
      bridge: standard_bridge("cow", "goat")
    },
    horse: {
      line: "She's dead, of course!",
      bridge: nil
    }
  }
end
