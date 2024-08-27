# Binary Search Tree implementation
class Bst
  # include Enumerable to make use of enumarble methods after each is implemented
  include Enumerable

  # @!attribute [r] data
  #   @return [Integer] the value of the node
  # @!attribute [r] left
  #   @return [Bst] the left child of the node
  # @!attribute [r] right
  #   @return [Bst] the right child of the node
  attr_reader :data, :left, :right

  # initialize the node with the value
  # @param value [Integer] the value of the node
  def initialize(value)
    @data = value
  end

  # each method to iterate over the tree
  # @param block [Block] the block to be executed
  # @return [Enumerator] if no block is given
  def each(&block)
    return to_enum(:each) unless block_given?

    left&.each(&block)
    yield data
    right&.each(&block)
  end

  # insert a value into the Tree
  # @param value [Integer] the value to be inserted
  def insert(value)
    if value > data
      right ? right.insert(value) : @right = Bst.new(value)
    else
      left ? left.insert(value) : @left = Bst.new(value)
    end
  end
end
