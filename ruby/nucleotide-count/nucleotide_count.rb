class Nucleotide
  attr_reader :histogram

  def initialize(dna)
    raise ArgumentError if dna.match(/[^ATCG]/)

    @histogram = {
      'A' => dna.scan(/A/).count,
      'T' => dna.scan(/T/).count,
      'C' => dna.scan(/C/).count,
      'G' => dna.scan(/G/).count
    }
  end

  def self.from_dna(dna)
    new(dna)
  end

  def count(nucleotide)
    @histogram[nucleotide]
  end
end
