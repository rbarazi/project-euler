# http://projecteuler.net/index.php?section=problems&id=21
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and each of a and b are called amicable numbers.
# 
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# 
# Evaluate the sum of all the amicable numbers under 10000.

def divisors(number)
  divs = []
  min = 1
  max = number
  while( min <= max )
    if ((number % min) == 0)
      divs << min
      divs << max unless max == min || max == number
    end
    min += 1
  end
  return divs.uniq
end

def sum(arr)
  res = 0
  arr.each{|v| res += v }
  return res
end

def amicable?(number)
 
end

max = 10000

result = 0
(1..max).each{ |c| 
  div_sum = sum(divisors(c)) - c
   if ((sum(divisors(div_sum)) - div_sum) == c) && c != div_sum
     puts "#{c}"
     result += c
   end
}

puts result