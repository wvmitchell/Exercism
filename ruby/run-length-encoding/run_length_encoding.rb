module RunLengthEncoding
  def self.encode(input)
    input
      .scan(/(.)(\1*)/)
      .map(&:join)
      .reduce("") do |encoding, substring|
        length = substring.length
        char = substring[0]
        encoding + (length > 1 ? length.to_s + char : char)
      end
  end

  def self.decode(input)
    input
      .scan(/\d+\D|(?<!\d)\D/)
      .reduce("") do |decoding, substring|
        number_match = substring.match(/\d+/)
        count = number_match ? number_match.to_s.to_i : 1
        decoding + substring[-1] * count
      end
  end
end
