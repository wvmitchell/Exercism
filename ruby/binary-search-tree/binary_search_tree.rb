class Bst
  include Enumerable
  attr_reader :data, :left, :right

  def initialize(value)
    @data = value
  end

  def each(&block)
    return to_enum(:each) unless block_given?

    left&.each(&block)
    yield data
    right&.each(&block)
  end

  def insert(value)
    if value > data
      right ? right.insert(value) : @right = Bst.new(value)
    else
      left ? left.insert(value) : @left = Bst.new(value)
    end
  end
end
