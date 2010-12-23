# http://projecteuler.net/index.php?section=problems&id=12
# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
# 
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# 
# Let us list the factors of the first seven triangle numbers:
# 
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.
# 
# What is the value of the first triangle number to have over five hundred divisors?

def divisors(number)
  divs = []
  min = 1
  max = number
  while( min <= max )
    tmp_max = (number / min) + (number % min)
    max = tmp_max if tmp_max < max
    if ((number % min) == 0)
      divs << min
      divs << max unless max == min
    end
    min += 1
  end
  return divs.uniq
end

n = 0
divisors_count = 0
index = 1
until divisors_count > 500
  n += index
  tmp_divs = divisors(n)
  divisors_count = tmp_divs.size
  puts "#{index}: #{n}: #{tmp_divs.size}"
  index += 1
end