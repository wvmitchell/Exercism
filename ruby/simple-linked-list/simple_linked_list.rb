class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum)
    @datum = datum
  end
end

class SimpleLinkedList
  def initialize(arr = [])
    duplicate = arr.to_a
    while (datum = duplicate.shift)
      elem = Element.new(datum)
      elem.next = @head if @head
      @head = elem
    end
  end

  def push(elem)
    elem.next = @head if @head
    @head = elem
    self
  end

  def pop
    return nil unless @head

    elem = @head
    @head = elem.next
    elem.next = nil
    elem
  end

  def to_a
    result = []
    current = @head

    until current.nil?
      result << current.datum
      current = current.next
    end

    result
  end

  def reverse!
    return self unless @head

    current = @head
    next_node = @head.next
    current.next = nil

    until next_node.nil?
      temp = next_node.next
      next_node.next = current
      current = next_node
      next_node = temp
    end

    @head = current
    self
  end
end
