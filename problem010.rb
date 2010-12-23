# http://projecteuler.net/index.php?section=problems&id=10
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.

primes = []
total = 0

def is_prime?(x)
  prime = true
  min = 2
  max = (x / min) + (x % min)
  while( min <= max )
    prime = ((x % min) > 0)
    min += 1
    max = (x / min) + (x % min)
    break unless prime
  end
  return prime
end

(2..1999999).each do |i|
  puts i
  next if (i > 2) and (i.even?)
  if is_prime?(i)
    primes << i
    total += i
  end
end

puts "The sum is #{total}"