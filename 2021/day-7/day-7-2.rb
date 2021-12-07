class Integer
  def fact
    (1..self).reduce(:+) || 1
  end
end

file = File.open('day-7.txt')

crab_positions = file.read.split(",").map(&:to_i)

min = crab_positions.min
max = crab_positions.max

lowest_fuel = 500000000000000000000
lowest_fuel_position = 0

(min..max).each do |potential_position|
  fuel = 0

  crab_positions.each do |position|
    fuel += ((position - potential_position).abs).fact
  end
  if fuel < lowest_fuel
    lowest_fuel = fuel
    lowest_fuel_position = potential_position
  end
end

p lowest_fuel, lowest_fuel_position