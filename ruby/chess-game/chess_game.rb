module Chess
  RANKS = (1..8)
  FILES = ('A'..'H')

  def self.valid_square?(rank, file)
    RANKS.include?(rank) && FILES.include?(file)
  end

  def self.nick_name(first_name, last_name)
    "#{first_name[0..1]}#{last_name[-2..-1]}".upcase
  end

  def self.move_message(first_name, last_name, square)
    nn = nick_name(first_name, last_name)
    rank_and_file = square
                      .split('')
                      .reverse
                      .map {|m| m.match(/[A-Z]/) ? m : m.to_i }

    if valid_square?(*rank_and_file)
      "#{nn} moved to #{square}"
    else
      "#{nn} attempted to move to #{square}, but that is not a valid square"
    end
  end
end
