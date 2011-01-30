# http://projecteuler.net/index.php?section=problems&id=30
# 
# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
# 
# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# As 1 = 14 is not a s^um it is not included.
# 
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
# 
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

def validate_number(number)
  sum = 0
  number.to_s.each_char do |digit|
    sum += digit.to_i ** 5
  end
  if number == sum
    puts number
    return number
  else
    return 0
  end
end

sum = 0
(0002..9999999).each do |n|
  sum += validate_number(n)
end

puts sum

# 4150
# 4151
# 54748
# 92727
# 93084
# 194979
# Sum: 443839