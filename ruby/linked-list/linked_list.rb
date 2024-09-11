require 'pry'

class Deque
  attr_accessor :head, :tail

  def push(elem)
    node = Node.new(elem)

    if head && tail
      tail.next_node = node
      node.prev_node = tail
      @tail = node
    else
      @head = @tail = node
    end
  end

  def pop
    node = tail
    if head == tail
      @head = nil
    else
      @tail = tail.prev_node
      tail.next_node = nil
    end
    node.value
  end

  def shift
    node = head
    if head == tail
      @head = nil
    else
      @head = head.next_node
      head.prev_node = nil
    end
    node.value
  end

  def unshift(elem)
    node = Node.new(elem)

    if head && tail
      head.prev_node = node
      node.next_node = head
      @head = node
    else
      @head = @tail = node
    end
  end
end

class Node
  attr_accessor :value, :next_node, :prev_node

  def initialize(value)
    @value = value
  end
end
