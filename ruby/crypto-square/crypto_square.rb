class Crypto
  # @!attribute [r] create_ciphertext
  # @return [String] the ciphertext
  attr_reader :ciphertext

  # initialize creates a new Crypto object
  # @param plaintext [String] the plaintext string to be encrypted
  # @return [nil]
  def initialize(plaintext)
    @ciphertext = create_ciphertext(plaintext)
  end

  private

  # create_ciphertext creates the ciphertext from the plaintext
  # @param plaintext [String] the plaintext string to be encrypted
  # @return [String] the ciphertext
  def create_ciphertext(plaintext)
    normalized = normalize(plaintext)
    rows, cols = dimensions(normalized)
    return normalized if rows <= 1

    normalized
      .ljust(rows * cols, " ")
      .chars
      .each_slice(cols)
      .to_a
      .transpose
      .map(&:join)
      .join(" ")
  end

  # normalize removes all non-alphanumeric characters and downcases the String
  # @param plaintext [String] the plaintext string to be encrypted
  # @return [String] the normalized String
  def normalize(plaintext)
    plaintext.downcase.gsub(/[^a-z0-9]/, "")
  end

  # dimensions returns the size of rows and columns given a string
  # @param str [String] the string to consider
  # @return [Integer, Integer]
  def dimensions(str)
    cols = Math.sqrt(str.length).ceil
    rows = cols - 1
    rows += 1 if cols * rows < str.length
    [rows, cols]
  end
end
