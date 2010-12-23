# http://projecteuler.net/index.php?section=problems&id=48
# The series, 11 + 22 + 33 + ... + 1010 = 10405071317.
# 
# Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.

sum = 0
(1..1000).each{|n| sum += n**n}
sum_string = sum.to_s
puts sum_string[(sum_string.size - 10)..(sum_string.size - 1)]