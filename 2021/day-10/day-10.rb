file = File.open('day-10.txt')

data = file.readlines.map(&:chomp)

map = {
  "[" => "]",
  "<" => ">",
  "(" => ")",
  "{" => "}"
}

p map

count_illegal = 0
count_incomplete = 0
illegals = []
sequence = []

data.each do |line|
  line.each_char.with_index do |bracket, index|
    if map[bracket]
      sequence << bracket
    else
      if map[sequence.last] == bracket
        sequence.pop
      else
        illegals << bracket
        count_illegal += 1
        break
      end
    end
    
  end
end

map_to_score = {
  ")" => 3,
  "]" => 57,
  "}" => 1197,
  ">" => 25137
}

score = 0
illegals.each do |illegal|
  score += map_to_score[illegal]
end

p score

p count_illegal
p illegals