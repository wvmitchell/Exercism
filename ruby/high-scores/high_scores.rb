HighScores = Struct.new(:scores) do
  def latest
    scores.last
  end

  def personal_best
    scores.max
  end

  def personal_top_three
    scores.sort { |a, b| b <=> a }[0..2]
  end

  def latest_is_personal_best?
    latest == personal_best
  end
end
