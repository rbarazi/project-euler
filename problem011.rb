# http://projecteuler.net/index.php?section=problems&id=11
# In the 2020 grid below, four numbers along a diagonal line have been marked in red.
# 
# 08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
# 49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
# 81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
# 52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
# 22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
# 24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
# 32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
# 67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
# 24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
# 21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
# 78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
# 16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
# 86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
# 19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
# 04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
# 88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
# 04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
# 20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
# 20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
# 01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48
# The product of these numbers is 26  63  78  14 = 1788696.
# 
# What is the greatest product of four adjacent numbers in any direction (up, down, left, right, or diagonally) in the 2020 grid?



grid = [%w(08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08),
        %w(49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00),
        %w(81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65),
        %w(52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91),
        %w(22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80),
        %w(24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50),
        %w(32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70),
        %w(67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21),
        %w(24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72),
        %w(21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95),
        %w(78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92),
        %w(16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57),
        %w(86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58),
        %w(19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40),
        %w(04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66),
        %w(88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69),
        %w(04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36),
        %w(20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16),
        %w(20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54),
        %w(01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48)]

buffer_size = 4
products = []
greatest_product = 0
# 
# grid.each_with_index do |row, row_index|
#   row.each_with_index do |column, column_index|
#     buffers = []
#     if column_index < (row.size - buffer_size)
#       # row_buffer
#       buffers << row[column_index..((buffer_size - 1) + column_index)]
#       # diagonal_buffer
#       buffers << (0..(buffer_size - 1)).collect{|index| grid[row_index + index][column_index + index]}
#     end
# 
#     if row_index < (grid.size - buffer_size)
#       # column_buffer
#       buffers << (row_index..((buffer_size - 1) + row_index)).collect{|i| grid[i][column_index]}
#     end
# 
#     if column_index >= buffer_size
#       # rdiagonal_buffer
#       buffers << (0..(buffer_size - 1)).collect{|index| grid[row_index + index][column_index - index]}
#     end
#     buffers.compact.each do |buffer|
#       if buffer.size == 4
#         v = 1
#         buffer.collect(&:to_i).each{|n| v *= n }
#         products << v
#         greatest_product = v if v > greatest_product
#       end
#     end
#   end
# end


# Looping through rows
(0..(grid.size - 1)).each do |row_index|
  (0..((grid[row_index].size - 1) - (buffer_size - 1))).each do |column_index|
    buffer = grid[row_index][column_index..((buffer_size - 1) + column_index)]
    puts buffer.inspect
    v = 1
    buffer.collect(&:to_i).each{|n| v *= n }
    products << v
    greatest_product = v if v > greatest_product
  end
end

# Looping through columns
(0..((grid.size - 1) - (buffer_size - 1))).each do |row_index|
  (0..(grid[row_index].size - 1)).each do |column_index|
     buffer = (row_index..((buffer_size - 1) + row_index)).collect{|i| grid[i][column_index]}
     puts buffer.inspect
     v = 1
     buffer.collect(&:to_i).each{|n| v *= n }
     products << v
     greatest_product = v if v > greatest_product
  end
end

# Looping Diagonally starting top left
(0..((grid.size - 1) - (buffer_size - 1))).each do |row_index|
  (0..((grid[row_index].size - 1) - (buffer_size - 1))).each do |column_index|
    buffer = (0..(buffer_size - 1)).collect{|index| grid[row_index + index][column_index + index]}
    puts buffer.inspect
    v = 1
    buffer.collect(&:to_i).each{|n| v *= n }
    products << v
    greatest_product = v if v > greatest_product
  end
end

# Looping Diagonally starting top right
(0..((grid.size - 1) - (buffer_size - 1))).each do |row_index|
  ((buffer_size - 1)..(grid[row_index].size - 1)).each do |column_index|
    buffer = (0..(buffer_size - 1)).collect{|index| grid[row_index + index][column_index - index]}
    puts buffer.inspect
    v = 1
    buffer.collect(&:to_i).each{|n| v *= n }
    products << v
    greatest_product = v if v > greatest_product
  end
end

puts "The greatest product is: #{greatest_product}"

# Ruby 1.9.2
# real  0m0.054s
# user  0m0.019s
# sys 0m0.008s

# Ruby 1.8.7
# real  0m0.026s
# user  0m0.021s
# sys 0m0.005s

