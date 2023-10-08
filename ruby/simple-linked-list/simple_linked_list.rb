# frozen_string_literal: true

# A single node
class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(num)
    @datum = num
    @next = nil
  end
end

# A list of nodes
class SimpleLinkedList
  def initialize(arr = [])
    @head = nil
    arr.each { |val| push(Element.new(val)) }
  end

  def push(element)
    if @head
      current_node = @head
      current_node = current_node.next while current_node.next
      current_node.next = element
    else
      @head = element
    end
    self
  end

  def pop
    return unless @head

    current_node = @head
    next_node = current_node.next
    if !next_node
      @head = nil
      current_node
    else
      while current_node.next && next_node.next
        current_node = next_node
        next_node = next_node.next
      end
      current_node.next = nil
      next_node
    end
  end

  def to_a
    arr = []
    current_node = @head

    return arr unless current_node

    while current_node
      arr.unshift(current_node.datum)
      current_node = current_node.next
    end
    arr
  end

  def reverse!
    prev_node = nil
    current_node = @head

    while current_node
      next_node = current_node.next
      current_node.next = prev_node
      prev_node = current_node
      current_node = next_node
    end

    @head = prev_node
    self
  end
end
