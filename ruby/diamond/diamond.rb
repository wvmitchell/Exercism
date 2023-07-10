require 'pry'
# module Diamond
#   def self.make_diamond(depth)
#     letters = ('A'..depth).to_a
#     top = make_half_diamond(letters)
#     bottom = (top.reverse)[1..-1]
#     (top + bottom).join('')
#   end
# 
#   def self.make_half_diamond(letters)
#     width = letters.length * 2 - 1
#     letters.map.with_index do |letter, index|
#       padding = letters.length - index - 1
#       if(index > 0)
#         "%#{padding+1}s%#{index*2}s%#{padding}s\n" % [letter,letter,'']
#       else
#         "%#{padding+1}s%#{padding}s\n" % [letter, '']
#       end
#     end
#   end
# end
module Diamond
  def self.make_diamond(letter)
    return "A\n" if letter == 'A'
    a = ("A"..letter).to_a 
    b = a.join 
    c = b.reverse + b[1..-1]
    binding.pry
    half_diamond = a.map { |letter| c.gsub(/[^#{letter}]/, ' ') + "\n" }
    (half_diamond += half_diamond[0..-2].reverse).join 
   end  
end
