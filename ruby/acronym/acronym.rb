module Acronym
  extend self

  def abbreviate(text)
    text.scan(/\b\w/).join.upcase
  end
end
