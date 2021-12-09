file = File.open('day-7.txt')

crab_positions = file.read.split(",").map(&:to_i)

p crab_positions

min = 900
max = 0

crab_positions.each do |position|
  if position < min
    min = position
  end
  if position > max
    max = position
  end
end

lowest_fuel = 5000000
lowest_fuel_position = 0

(min..max).each do |potential_position|
  fuel = 0

  crab_positions.each do |position|
    fuel += (position - potential_position).abs
  end
  if fuel < lowest_fuel
    lowest_fuel = fuel
    lowest_fuel_position = potential_position
  end
end

p lowest_fuel, lowest_fuel_position