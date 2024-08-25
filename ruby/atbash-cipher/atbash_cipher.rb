module Atbash
  # LETTERS is a constant that holds the alphabet
  # @return [String] the alphabet
  LETTERS = ("a".."z").to_a

  # KEY is a constant hash that holds the alphabet and its reverse
  # @return [Hash<String, String>] the alphabet and its reverse
  KEY = LETTERS.zip(LETTERS.reverse).to_h

  # encode is a class method that takes a plaintext string
  # and returns a ciphertext string
  # @param plaintext [String] the plaintext String
  # @return [String] the ciphertext String
  def self.encode(plaintext)
    chars = plaintext.downcase.chars
    chars
      .map do |char|
        next if char.match?(/\W/)

        KEY[char] || char
      end
      .compact
      .each_slice(5)
      .map(&:join)
      .join(" ")
  end

  # decode is a class method that takes a ciphertext String
  # and returns a plaintext String
  # @param ciphertext [String] the ciphertext String
  # @return [String] the plaintext String
  def self.decode(ciphertext)
    ciphertext.delete(" ").chars.map { |char| KEY[char] || char }.join
  end
end
