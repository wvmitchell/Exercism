class School
  attr_reader :grades

  def initialize
    @grades = (1..7).to_h { |i| [i, []] }
  end

  def add(student, grade)
    return false if roster.include?(student)

    @grades[grade] << student
    @grades[grade].sort!
    true
  end

  def roster
    grades.values.flatten
  end

  def grade(year)
    grades[year]
  end
end
