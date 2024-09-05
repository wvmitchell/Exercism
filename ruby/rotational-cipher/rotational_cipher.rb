module RotationalCipher
  LETTERS = ("a".."z").to_a.freeze
  UPCASE_LETTERS = ("A".."Z").to_a.freeze

  # rotate performs a rotational cipher
  # @param string [String] the string to rotate
  # @param rot [Integer] the number characters to rotate
  def self.rotate(string, rot)
    string
      .chars
      .map do |char|
        next char unless char =~ /[a-zA-Z]/

        if UPCASE_LETTERS.index(char)
          rotate_char(UPCASE_LETTERS, char, rot)
        else
          rotate_char(LETTERS, char, rot)
        end
      end
      .join
  end

  def self.rotate_char(letters, char, rot)
    rot_index = (letters.index(char) + rot) % 26
    letters[rot_index]
  end
end
