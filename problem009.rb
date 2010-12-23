# http://projecteuler.net/index.php?section=problems&id=9
# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# 
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

total = 1000
a = b = c = 1

(1..999).each do |i|
  (1..999).each do |j|
    k = (i**2 + j**2)**0.5
    if( i + j + k) == total
      b = i
      a = j
      c = k
    end
  end
end
puts "The product is: #{a * b * c}"