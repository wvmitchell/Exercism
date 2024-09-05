module RotationalCipher
  LETTERS = ("a".."z").to_a.freeze

  # rotate performs a rotational cipher
  # @param string [String] the string to rotate
  # @param rot [Integer] the number characters to rotate
  # @return [String] the rotated string
  def self.rotate(string, rot)
    string
      .chars
      .map do |char|
        next char unless char =~ /[a-zA-Z]/

        new_char = rotate_char(char, rot)
        upcase?(char) ? new_char.upcase : new_char
      end
      .join
  end

  # rotate_char rotates a single character
  # @param char [String] the character to rotate
  # @param rot [Integer] the number characters to rotate
  # @return [String] the rotated character
  def self.rotate_char(char, rot)
    rot_index = (LETTERS.index(char.downcase) + rot) % 26
    LETTERS[rot_index]
  end

  # upcase? checks if a character is uppercase
  # @param char [String] the character to check
  # @return [Boolean] true if the character is uppercase
  def self.upcase?(char)
    char.upcase == char
  end
end
