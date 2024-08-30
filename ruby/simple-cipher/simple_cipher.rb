class Cipher
  attr_reader :key

  LETTERS = ("a".."z").to_a

  def initialize(key = nil)
    raise ArgumentError if invalid_key(key)

    @key = key || make_key
  end

  def encode(plaintext)
    code(plaintext) do |shift_dist, char_index|
      (char_index + shift_dist) % LETTERS.length
    end
  end

  def decode(ciphertext)
    code(ciphertext) do |shift_dist, char_index|
      (char_index - shift_dist) % LETTERS.length
    end
  end

  private

  def code(text)
    text
      .downcase
      .chars
      .map
      .with_index do |char, i|
        shift_dist = LETTERS.index(@key[i])
        char_index = LETTERS.index(char)
        coded_index = yield(shift_dist, char_index)
        LETTERS[coded_index]
      end
      .join
  end

  def make_key
    ("a".."z").to_a.sample(10).join
  end

  def invalid_key(key)
    key&.match(/[A-Z0-9]/) || key == ""
  end
end
