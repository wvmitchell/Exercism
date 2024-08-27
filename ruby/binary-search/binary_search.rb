class BinarySearch
  def initialize(array)
    @array = array
    @left = 0
    @right = array.length - 1
    @mid = ((@left + @right) / 2).floor
  end

  def search_for(target)
    while @left <= @right
      mid_value = @array[@mid]
      if mid_value == target
        return @mid
      elsif mid_value > target
        @right = @mid - 1
      else
        @left = @mid + 1
      end

      @mid = ((@left + @right) / 2).floor
    end
  end
end
