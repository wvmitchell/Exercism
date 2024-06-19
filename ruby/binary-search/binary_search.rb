class BinarySearch
  def initialize(array)
    @array = array
    @left = 0
    @right = array.length - 1
    @mid = array.length / 2
  end

  def search_for(target)
    while @left <= @right
      return @mid if target == @array[@mid]

      if target < @array[@mid]
        @right = @mid - 1
      else
        @left = @mid + 1
      end
      @mid = (@left + @right) / 2
    end
  end
end
