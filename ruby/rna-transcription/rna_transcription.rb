module Complement
  DNA = 'CGTA'.freeze
  RNA = 'GCAU'.freeze

  def self.of_dna(dna_str)
    # dna_str.gsub(/C|G|T|A/) do |match|
    #   case match
    #   when 'C'
    #     'G'
    #   when 'G'
    #     'C'
    #   when 'T'
    #     'A'
    #   when 'A'
    #     'U'
    #   end
    # end
    dna_str.tr(DNA, RNA)
  end
end
