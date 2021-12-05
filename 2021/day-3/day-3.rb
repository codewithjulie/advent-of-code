file = File.open('day-3.txt')

binaries = file.read.split("\n")

gamma_rate = ""
epsilon_rate = ""

length = binaries[0].length

length.times do |num|
  ones = 0
  zeroes = 0
  binaries.each do |binary|
    bit = binary[num].to_i
    if bit == 0
      zeroes += 1
    else
      ones += 1
    end
  end
  if zeroes > ones
    gamma_rate << "0"
    epsilon_rate << "1"
  else
    gamma_rate << "1"
    epsilon_rate << "0"
  end
end

p gamma_rate

first = gamma_rate.to_i(2)

second = epsilon_rate.to_i(2)

p first * second

length.times do |num|
  ones = 0
  zeroes = 0
  binaries.each do |binary|
    bit = binary[num].to_i
    if bit == 0
      zeroes += 1
    else
      ones += 1
    end
  end
  if zeroes > ones && binaries.size > 1
    binaries.filter! {|binary| binary[num] == "0"}
  else
    if binaries.size > 1
      binaries.filter! {|binary| binary[num] == "1"}
    end
  end
end

oxygen_generator_rating = binaries[0].to_i(2)
p oxygen_generator_rating
