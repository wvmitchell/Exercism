class CustomSet
  attr_reader :set

  def initialize(elements)
    @set = Set.new(elements)
  end

  def size = set.size

  def empty? = set.empty?

  def member?(element) = set.member? element

  def subset?(other) = set.subset? other.set

  def disjoint?(other) = set.disjoint? other.set

  def ==(other) = set.eql? other.set

  def add(value)
    set.add value
    self
  end

  def intersection(other) = CustomSet.new(set.intersection(other.set))

  def difference(other) = CustomSet.new(set.difference(other.set))

  def union(other) = CustomSet.new(set.union(other.set))
end
