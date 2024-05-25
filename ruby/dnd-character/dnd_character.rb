class DndCharacter
  def self.modifier(score)
    (score - 10) / 2
  end

  attr_reader :strength,
              :dexterity,
              :constitution,
              :intelligence,
              :wisdom,
              :charisma,
              :hitpoints

  def initialize
    @strength = rand(3..18)
    @dexterity = rand(3..18)
    @constitution = rand(3..18)
    @intelligence = rand(3..18)
    @wisdom = rand(3..18)
    @charisma = rand(3..18)
    @hitpoints = 10 + DndCharacter.modifier(@constitution)
  end
end
