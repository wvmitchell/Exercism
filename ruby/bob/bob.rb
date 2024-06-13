module Bob
  def hey(remark)
    case remark
    when loud_question?
      "Calm down, I know what I'm doing!"
    when shouting?
      "Whoa, chill out!"
    when question?
      "Sure."
    when silent?
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end

  def shouting? = ->(t) { t.upcase == t && t =~ /[A-Z]/ }
  def question? = ->(t) { t.strip.end_with?("?") }
  def loud_question? = ->(t) { shouting?[t] && question?[t] }
  def silent? = ->(t) { t.strip.empty? }

  module_function :hey, :shouting?, :question?, :loud_question?, :silent?
end
