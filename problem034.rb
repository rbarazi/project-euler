# http://projecteuler.net/index.php?section=problems&id=34
# 
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# 
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# 
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

def curious_number(number)
  sum = 0
  number.to_s.each_char do |digit|
    sum += factorial(digit.to_i)
  end
  if number == sum
    puts number
    return number
  else
    return 0
  end
end

def factorial(value)
  result = 1
  (1..value).each{|v| result *= v}
  return result
end

sum = 0
(0003..99999).each do |n|
  sum += curious_number(n)
end

puts "Sum: #{sum}"

# 145
# 40585
# Sum: 40730