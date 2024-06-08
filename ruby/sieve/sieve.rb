class Sieve
  def initialize(up_to)
    @candidates = (2..up_to).to_h { |n| [n, :unmarked] }
  end

  def primes
    @primes ||= screen_candidates
  end

  def screen_candidates
    while unmarked_candidates?
      next_prime = first_unmarked
      @candidates[next_prime] = :prime
      mark_multiples(next_prime)
    end

    @candidates.select { |_, mark| mark == :prime }.keys
  end

  private

  def unmarked_candidates?
    @candidates.values.include?(:unmarked)
  end

  def first_unmarked
    @candidates.find { |_, mark| mark == :unmarked }[0]
  end

  def mark_multiples(prime)
    @candidates.each do |num, mark|
      @candidates[num] = :not_prime if mark == :unmarked &&
                                       (num % prime).zero?
    end
  end
end
