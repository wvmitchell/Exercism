class Cipher
  attr_reader :key

  def initialize(key = nil)
    @key = key || ("a".."z").to_a.sample(10).join
  end

  def encode(plaintext); end
end
