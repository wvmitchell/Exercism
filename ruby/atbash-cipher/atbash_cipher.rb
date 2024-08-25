module Atbash
  # LETTERS is a constant that holds the alphabet
  # @return [String] the alphabet
  LETTERS = ("a".."z").to_a.join

  # encode is a class method that takes a plaintext string
  # and returns a ciphertext string
  # @param plaintext [String] the plaintext String
  # @return [String] the ciphertext String
  def self.encode(plaintext)
    decode(plaintext).chars.each_slice(5).map(&:join).join(" ")
  end

  # decode is a class method that takes a ciphertext String
  # and returns a plaintext String
  # @param ciphertext [String] the ciphertext String
  # @return [String] the plaintext String
  def self.decode(ciphertext)
    ciphertext.downcase.gsub(/\W/, "").tr(LETTERS, LETTERS.reverse)
  end
end
