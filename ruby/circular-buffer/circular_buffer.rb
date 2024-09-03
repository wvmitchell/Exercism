class CircularBuffer < Array
  def initialize(capacity)
    @capacity = capacity
    super(0)
  end

  def read
    raise BufferEmptyException if empty?

    shift
  end

  def write(value)
    raise BufferFullException if count == @capacity

    push(value)
  end

  def write!(value)
    if count < @capacity
      write(value)
    else
      shift
      push(value)
    end
  end

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end
end
