class Affine
  attr_reader :a, :b

  ALPHABET = ("a".."z").to_a

  def initialize(a, b)
    raise ArgumentError if a.gcd(ALPHABET.size) > 1

    @a = a
    @b = b
  end

  def encode(plaintext)
    plaintext
      .downcase
      .chars
      .map do |char|
        next char if char =~ /[0-9]/
        next unless char =~ /[a-z]/

        index = (a * ALPHABET.index(char) + b) % ALPHABET.length
        ALPHABET[index]
      end
      .compact
      .each_slice(5)
      .map(&:join)
      .join(" ")
  end

  def decode(ciphertext)
    ciphertext
      .chars
      .map do |char|
        next char if char =~ /[0-9]/
        next unless char =~ /[a-z]/

        index = (mmi(a, ALPHABET.length) * (ALPHABET.index(char) - b)) % 26
        ALPHABET[index]
      end
      .compact
      .join("")
  end

  def mmi(a, m)
    # Use the Extended Euclidean Algorithm to find the gcd and coefficients
    g, x, = extended_gcd(a, m)

    # If gcd is not 1, no modular inverse exists
    return nil if g != 1

    # Return the positive inverse value
    x % m
  end

  def extended_gcd(a, b)
    return a, 1, 0 if b.zero?

    # Recursively apply the Extended Euclidean Algorithm
    g, x1, y1 = extended_gcd(b, a % b)

    # Update x and y based on recursive results
    x = y1
    y = x1 - (a / b) * y1

    [g, x, y]
  end
end
