module Raindrops
  def self.convert(drops)
    sounds = { "Pling" => 3, "Plang" => 5, "Plong" => 7 }
    statement = sounds.reduce("") do |result, (sound, factor)|
      result += sound if (drops % factor).zero?
      result
    end
    statement.empty? ? drops.to_s : statement
  end
end
