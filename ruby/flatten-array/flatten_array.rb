module FlattenArray
  def self.flatten(nested_array)
    nested_array.flatten.reject(&:nil?)
  end
end
