module Bob
  def self.hey(remark)
    if shouting?(remark) && question?(remark)
      'Calm down, I know what I\'m doing!'
    elsif shouting?(remark)
      "Whoa, chill out!"
    elsif question?(remark)
      "Sure."
    elsif silent?(remark)
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end

  def self.shouting?(remark)
    remark.upcase == remark && remark.match(/[A-Z]/)
  end

  def self.question?(remark)
    remark.strip.end_with?("?")
  end

  def self.silent?(remark)
    remark.strip.empty?
  end
end
