# http://projecteuler.net/index.php?section=problems&id=15
# Starting in the top left corner of a 22 grid, there are 6 routes (without backtracking) to the bottom right corner.
# 
# http://projecteuler.net/project/images/p_015.gif
# 
# How many routes are there through a 2020 grid?

def routes_for(grid_size)
  result = 0
  case grid_size
  when 0 then result = 1
  when 1 then result = 2
  else
    (0..(grid_size-1)).each{|i|result += 2 * routes_for(i)}
  end
  return result
end

sum = 0
(2 ** 1000).to_s.each_char{|i| sum += i.to_i}
puts sum


# 1: 2
# 2: (2 * (1:)) + 2 * (0:)
# 3: (2 * (2:)) + 2 (1:) + 2 * (0:)