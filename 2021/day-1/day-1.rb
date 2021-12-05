###### Day 1 Part 1 ######

file = File.open('day-1.txt')

depth_measurements = file.read.split.map(&:to_i)

count = 0
pointer = 0

while pointer < depth_measurements.count
  if depth_measurements[pointer] > depth_measurements[pointer - 1]
    count += 1
  end
  pointer += 1
end

puts count


###### Day 1 Part 2 ######

pointer_1 = 0
pointer_2 = 2
counts_2 = 0

while pointer_2 < depth_measurements.size - 1
  sum_a = depth_measurements[pointer_1..pointer_2].sum
  sum_b = depth_measurements[(pointer_1 + 1)..(pointer_2 + 1)].sum
  if sum_b > sum_a
    counts_2 += 1
  end
  pointer_1 += 1
  pointer_2 += 1
end

puts counts_2