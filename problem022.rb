# http://projecteuler.net/index.php?section=problems&id=22
# Using names.txt http://projecteuler.net/project/names.txt, a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
# 
# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938  53 = 49714.
# 
# What is the total of all the name scores in the file?

sorted_array = File.read("assets/names.txt").split(",").collect{|w| w.gsub("\"","") }.sort

def name_value(name)
  v = 0
  name.each_byte {|c| v += (c - 64) }
  return v
end

result = 0
sorted_array.each_with_index do |name, index|
  result += (name_value(name) * (index + 1))
end

puts result