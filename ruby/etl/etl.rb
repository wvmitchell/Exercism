module ETL
  def self.transform(counts)
    counts.each_with_object({}) do |(count, letters), transformed|
      letters.each { |letter| transformed[letter.downcase] = count }
    end
  end
end
