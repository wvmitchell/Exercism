class Bst
  attr_reader :data, :left, :right

  def initialize(value)
    @data = value
  end

  def insert(value)
    if value <= @data
      @left ? @left.insert(value) : @left = Bst.new(value)
    else
      @right ? @right.insert(value) : @right = Bst.new(value)
    end
  end

  def each(&block)
    if block_given?
      @left&.each(&block)
      block.call(@data)
      @right&.each(&block)
    else
      enum_for(:each)
    end
  end
end
