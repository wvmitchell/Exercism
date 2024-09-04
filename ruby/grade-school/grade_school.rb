class School
  attr_reader :grades

  def initialize
    @grades = (1..7).to_h { |i| [i, []] }
  end

  def add(student, grade)
    if roster.include?(student)
      false
    else
      @grades[grade] << student
      @grades[grade].sort!
      true
    end
  end

  def roster
    grades.values.flatten
  end

  def grade(val)
    grades[val]
  end
end
