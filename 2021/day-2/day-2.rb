x = 0
y = 0

file = File.open('day-2.txt')

instructions = file.read.split("\n")

instructions.map! do |instruction|
  instruction = instruction.split(" ")
  direction, length = instruction
  [direction, length.to_i]
end

instructions.each do |direction, length|
  case direction
  when "forward"
    x += length
  when "down"
    y += length
  else
    y -= length
  end
end

p x * y


x = 0
y = 0
aim = 0

file = File.open('day-2.txt')

instructions = file.read.split("\n")

instructions.map! do |instruction|
  instruction = instruction.split(" ")
  direction, length = instruction
  [direction, length.to_i]
end

instructions.each do |direction, length|
  case direction
  when "forward"
    x += length
    y = aim * length + y
  when "down"
    aim += length
  else
    aim -= length
  end
end

p x * y