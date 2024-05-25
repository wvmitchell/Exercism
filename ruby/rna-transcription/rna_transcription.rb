module Complement
  def self.of_dna(dna_str) = dna_str.tr('GCTA', 'CGAU')
end
