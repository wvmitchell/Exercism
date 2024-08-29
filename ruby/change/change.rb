module Change
  # generate gives the fewest coins needed to reach a target, from a list of coins
  # @param coins [Array<Integer>] the coins that can be used
  # @param target [Integer] the target value that is needed
  def self.generate(coins, target)
    return [] if target.zero?
    raise NegativeTargetError if target.negative?

    coins.sort!.reverse!
    starting_path = []
    queue = [starting_path]

    until queue.empty?
      queue = filter_same_sums(queue)
      path = queue.shift
      coins.each do |coin|
        sum = path.sum + coin
        if sum == target
          return [*path, coin].sort
        elsif sum < target
          queue.push([*path, coin])
        end
      end
    end

    raise ImpossibleCombinationError
  end

  # filter_same_sums takes in an array of arrays, and filters outall but the one that sums to the same
  # @param queue1 [Array<Array<Integer>>] the queue to remove duplicate sums from
  # @return [Array<Array<Integer>>]
  def self.filter_same_sums(queue)
    sum_counts = {}

    queue.each do |path|
      sum = path.sum
      sum_counts[sum] ||= path
    end

    sum_counts.values
  end

  class ImpossibleCombinationError < StandardError
  end

  class NegativeTargetError < StandardError
  end
end
