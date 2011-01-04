# http://projecteuler.net/index.php?section=problems&id=15
# Starting in the top left corner of a 22 grid, there are 6 routes (without backtracking) to the bottom right corner.
# 
# http://projecteuler.net/project/images/p_015.gif
# 
# How many routes are there through a 2020 grid?

def routes_for(grid_size)
  choices = grid_size * 2
  
  factorial(choices) / (factorial(grid_size) * factorial(choices - grid_size))
end

def factorial(value)
  result = 1
  (1..value).each{|v| result *= v}
  return result
end

puts routes_for 20