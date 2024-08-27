module ListOps
  # arrays returns the length of the array
  # @param arr [Array]
  # @return [Integer] the length of the array
  def self.arrays(arr)
    arr.length
  end

  # reverser returns the reverse of the array
  # @param arr [Array]
  # @return [Array] the reverse of the array
  def self.reverser(arr)
    copy = arr.dup
    result = []

    result << copy.pop until copy.empty?
    result
  end

  # concatter returns the concatenation of two arrays
  # @param arr1 [Array]
  # @param arr2 [Array]
  # @return [Array] the concatenation of the two arrays
  def self.concatter(arr1, arr2)
    arr1 + arr2
  end

  # mapper returns the array with the block applied to each element
  # @param arr [Array]
  # @return [Array] the array with the block applied to each element
  def self.mapper(arr)
    result = []
    arr.each { |elem| result << yield(elem) }
    result
  end

  # filterer returns the array with the block applied to each element
  # @param arr [Array]
  # @return [Array] an array of elements for which the block returned true
  def self.filterer(arr)
    result = []
    arr.each { |elem| result << elem if yield(elem) }
    result
  end

  # sum_reducer returns the sum of the Array
  # @param arr [Array]
  # @return [Integer] the sum of the Array
  def self.sum_reducer(arr)
    reducer(arr, 0) { |acc, elem| acc + elem }
  end

  # factorial_reducer returns the factorial of the Array
  # @param arr [Array]
  # @return [Integer] the factorial of the Array
  def self.factorial_reducer(arr)
    reducer(arr, 1) { |acc, elem| acc * elem }
  end

  def self.reducer(arr, inital)
    result = inital
    arr.each { |elem| result = yield(result, elem) }
    result
  end
end
