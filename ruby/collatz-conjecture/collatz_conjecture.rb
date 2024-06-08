module CollatzConjecture
  def self.steps(start)
    raise ArgumentError if start <= 0

    steps = 0
    while start != 1
      start = start.even? ? start / 2 : start * 3 + 1
      steps += 1
    end

    steps
  end
end
