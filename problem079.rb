# http://projecteuler.net/index.php?section=problems&id=79
# A common security method used for online banking is to ask the user for three random characters from a passcode. For example, if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be: 317.
# 
# The text file, keylog.txt, contains fifty successful login attempts.
# 
# Given that the three characters are always asked for in order, analyse the file so as to determine the shortest possible secret passcode of unknown length.

number = %w(319 680 180 690 129 620 762 689 762 318 368 710 720 710 629 168 160 689 716 731 736 729 316 729 729 710 769 290 719 680 318 389 162 289 162 718 729 319 790 680 890 362 319 760 316 729 380 319 728 716)

num = {}

number.each do |t|
  num[t[0..0]] ||= []
  num[t[1..1]] ||= []
  num[t[0..0]] += [t[1..1], t[2..2]]
  num[t[1..1]] += [t[2..2]]
end
# puts num.inspect

num.each do |k,v|
  num[k] = v.uniq
end

puts num.inspect

l = []
(1..(num.size)).each do |i|
  num.each do |k,v|
    if ((num.keys - [k]) - v).empty?
      l << k
      num.delete(k)
    end
  end
end

sorted_passcode = l.join+"0"


def validate_number(passcode, try)
  valid = true
  i = 0
  ord = []
  try.each_char do |t|
    valid = valid && (passcode.index(t) >= i)
    i = passcode.index(t)
    ord << i
  end
  puts "#{try}, #{ord.inspect}" unless valid
  return valid
end


number.each do |try|
  puts validate_number(sorted_passcode, try)
end
