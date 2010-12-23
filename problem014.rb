# http://projecteuler.net/index.php?section=problems&id=14
# The following iterative sequence is defined for the set of positive integers:
# 
# n  n/2 (n is even)
# n  3n + 1 (n is odd)
# 
# Using the rule above and starting with 13, we generate the following sequence:
# 
# 13  40  20  10  5  16  8  4  2  1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# 
# Which starting number, under one million, produces the longest chain?
# 
# NOTE: Once the chain starts the terms are allowed to go above one million.

def get_chain(number)
  chain = []
  result = number
  until result == 1
    chain << result
    result = result.odd? ? (3 * result + 1) : (result / 2)
  end
  chain << 1
  return chain
end

max_number = 13
chain_count = 0
# (500001..999999).each do |number|
#   next if number.even?
(1..999999).each do |number|
  if (tmp_chain_count = get_chain(number).size) > chain_count
    puts "New Max: #{number}"
    chain_count = tmp_chain_count
    max_number = number
  end
end