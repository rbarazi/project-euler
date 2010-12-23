# http://projecteuler.net/index.php?section=problems&id=36
# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
# 
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# 
# (Please note that the palindromic number, in either base, may not include leading zeros.)

def palindromic?(number)
  if number.to_s == number.to_s.reverse
    return true
  end
end

sum = 0
(1..999999).each do |number|
  if palindromic?(number) && palindromic?(number.to_s(2))
    sum += number
    puts number
  end
end
puts "The Sum is: #{sum}"