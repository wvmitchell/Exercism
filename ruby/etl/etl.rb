module ETL
  def self.transform(counts)
    counts.each_with_object({}) do |(count, letters), transformed|
      transformed.merge!(letters.to_h { |letter| [letter.downcase, count] })
    end
  end
end
