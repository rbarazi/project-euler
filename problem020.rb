# http://projecteuler.net/index.php?section=problems&id=20
# n! means n  (n  1)  ...  3  2  1
# 
# Find the sum of the digits in the number 100!

def factorial(value)
  result = 1
  (1..value).each{|v| result *= v}
  return result
end

result = 0
factorial(100).to_s.each_char{|c| result += c.to_i}

puts result