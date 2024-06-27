module RailFenceCipher
  def self.encode(string, num_rails)
    return string if num_rails == 1

    railify(string, num_rails).flatten.reject { |elem| elem == "." }.join("")
  end

  def self.decode(string, num_rails)
    return string if num_rails == 1

    chars = string.chars

    placeholder_matrix =
      railify("?" * string.length, num_rails).map do |placeholder_row|
        placeholder_row.map { |elem| elem ? chars.shift : elem }
      end

    placeholder_matrix[0].zip(*rail_matrix[1..]).flatten.compact.join
  end

  def self.railify(string, num_rails)
    rail_matrix = Array.new(num_rails) { Array.new(string.length) }
    chars = string.chars
    n = 0
    m = 0
    direction = "down"

    until chars.empty?
      rail_matrix[m][n] = chars.shift
      n += 1

      direction = "down" if m.zero?
      direction = "up" if m == (num_rails - 1)

      direction == "down" ? m += 1 : m -= 1
    end

    rail_matrix
  end
end
