# http://projecteuler.net/index.php?section=problems&id=17
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# 
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
# 
# 
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

WORD_MAP = {
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen",
  20 => "twenty",
  30 => "thirty",
  40 => "forty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety",
  100 => "hundred",
  1000 => "thousand"
}

def stringify(number)
  result = ""
  thousands = (number / 1000).to_i
  if thousands > 0
    result += WORD_MAP[thousands] + WORD_MAP[1000]
    return result
  end

  hundreds = (number / 100).to_i
  remainder = (number % 100).to_i
  if (1..9).include?(hundreds)
    result += WORD_MAP[hundreds] + WORD_MAP[100]
    result += "and" if remainder > 0
  end
  if remainder > 0
    result += WORD_MAP[remainder] || WORD_MAP[(remainder / 10).to_i * 10] + WORD_MAP[remainder % 10]
  end
  return result
end

result = 0
(1..1000).each do |number|
  result += stringify(number).size
  puts stringify(number)
end
puts "The result is #{result}"
