class Cipher
  attr_reader :key
  CHARS = ('a'..'z').to_a

  def initialize(key=nil)
    @key = key || random_key
    raise ArgumentError unless @key.match(/\A[a-z]+\z/)
  end

  def encode(plaintext)
    code(plaintext, self.method(:encode_char))
  end

  def decode(ciphertext)
    code(ciphertext, self.method(:decode_char))
  end

  def code(text, method)
    text.chars.each_with_index.reduce('') do |altered, (char, index)|
      offset_char = key[index]
      char_position = CHARS.index(char)
      key_position = CHARS.index(offset_char)
      altered + method.call(char_position, key_position)
    end
  end

  def encode_char(char_position, key_position)
    cipher_position = (char_position + key_position) % 26
    CHARS[cipher_position]
  end

  def decode_char(char_position, key_position)
    cipher_position = char_position - key_position
    CHARS[cipher_position]
  end

  def random_key
    100.times.map {|_| CHARS[rand(26)]}.join('')
  end
end
