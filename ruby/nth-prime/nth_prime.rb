module Prime
  def nth(num)
    raise ArgumentError, "There is no zeroth prime" if num <= 0

    primes = [2, 3, 5]
    count = 3
    test = 6

    while count < num
      test_root = Math.sqrt(test).floor
      test_primes = primes.take_while { |p| p <= test_root }
      is_prime =
        test.odd? && (test % 3).positive? &&
        test_primes.all? { |p| (test % p).positive? }

      if is_prime
        primes << test
        count += 1
      end

      test += 1
    end

    primes[num - 1]
  end

  module_function :nth
end
