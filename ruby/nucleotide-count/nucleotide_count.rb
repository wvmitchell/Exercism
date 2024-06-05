class Nucleotide
  attr_accessor :histogram

  def self.from_dna(dna)
    raise ArgumentError if dna.match(/[^ATCG]/)

    nuc = Nucleotide.new
    nuc.histogram = {
      'A' => dna.scan(/A/).count,
      'T' => dna.scan(/T/).count,
      'C' => dna.scan(/C/).count,
      'G' => dna.scan(/G/).count
    }
    nuc
  end

  def count(nucleotide)
    @histogram[nucleotide]
  end
end
