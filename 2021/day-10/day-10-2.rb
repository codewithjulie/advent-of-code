file = File.open('day-10.txt')

data = file.readlines.map(&:chomp)

map = {
  "[" => "]",
  "<" => ">",
  "(" => ")",
  "{" => "}"
}
count_incomplete = 0
to_add_all = []


data.each do |line|
  to_add = []
  sequence = []
  line.each_char.with_index do |bracket, index|
    if map[bracket]
      sequence << bracket
    else
      if map[sequence.last] == bracket
        sequence.pop
      else
        sequence.clear
        break
      end
    end
  end
  sequence.each do |bracket|
    to_add.unshift(map[bracket])
  end
  to_add_all << to_add
  sequence = []
end
map_to_score = {
  ")" => 1,
  "]" => 2,
  "}" => 3,
  ">" => 4
}
scores = []

to_add_all.each do |line|
  sub_score = 0
  line.each do |bracket|
    sub_score *= 5
    sub_score += map_to_score[bracket]
  end
  scores << sub_score
end


scores = scores.filter { |score| score > 0 }.sort!


p scores[(scores.size/2)]

p scores
# 2083881232 was wrong first guess
