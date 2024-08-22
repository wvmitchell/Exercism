class InvalidCodonError < StandardError
end

module Translation
  # takes a strand of RNA and returns the proteins that are translated from the RNA
  # @param [String] strand
  # @return [Array<String>]
  def self.of_rna(strand)
    codons = strand.scan(/\w{3}|\w+/)
    protiens = []
    codons.each do |codon|
      case codon
      when "AUG"
        protiens << "Methionine"
      when "UUU", "UUC"
        protiens << "Phenylalanine"
      when "UUA", "UUG"
        protiens << "Leucine"
      when "UCU", "UCC", "UCA", "UCG"
        protiens << "Serine"
      when "UAU", "UAC"
        protiens << "Tyrosine"
      when "UGU", "UGC"
        protiens << "Cysteine"
      when "UGG"
        protiens << "Tryptophan"
      when "UAA", "UAG", "UGA"
        break
      else
        raise InvalidCodonError
      end
    end
    protiens
  end
end
