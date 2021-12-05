file = File.open('day-3.txt')

binaries = file.read.split("\n")
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
  
  if zeroes > ones && binaries.size > 1
    binaries.filter! {|binary| binary[num] == "1"}
  else
    if binaries.size > 1
      binaries.filter! {|binary| binary[num] == "0"}
    end
  end
end

p binaries[0].to_i(2)
