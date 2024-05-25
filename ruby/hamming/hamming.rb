module Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.length != strand2.length

    strand1
      .each_char
      .with_index
      .count { |char, index| char != strand2[index] }
  end
end
