class CircularBuffer
  def initialize(size)
    @size = size
    @buffer = []
  end

  def read
    raise BufferEmptyException if @buffer.empty?

    @buffer.shift
  end

  def write(value)
    raise BufferFullException if @buffer.size == @size

    @buffer << value
  end

  def write!(value)
    if @buffer.size < @size
      write(value)
    else
      @buffer.shift
      @buffer << value
    end
  end

  def clear
    @buffer.clear
  end

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end
end
