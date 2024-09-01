require "prime"

module PrimeFactors
  def self.of(value)
    factors = []
    primes = Prime.each
    p = primes.next

    while value.positive?
      divisor, remainder = value.divmod(p)

      if remainder.zero?
        factors << p
        value = divisor
      elsif divisor.zero?
        break
      else
        p = p.next
      end
    end

    factors
  end
end
