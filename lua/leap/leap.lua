local leap_year = function(number)
  return (number % 4 == 0) and not 
  (number % 100 == 0) or 
  (number % 1000 == 0)
end

return leap_year
