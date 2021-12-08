class Code
  def initialize(ten_codes, output_values)
    @ten_codes = ten_codes.sort_by(&:length)
    @output_values = output_values
    @map = {}
  end

  def determine_value(code)
    length = code.length
  
    if length == 2
      @map[1] = code.chars.sort.join
    elsif length == 3
      @map[7] = code.chars.sort.join
    elsif length == 4
      @map[4] = code.chars.sort.join
    elsif length == 7
      @map[8] = code.chars.sort.join
    elsif length == 6
      decode_six(code)
    elsif length == 5
      decode_five(code)
    end
  end
  

  def decode_six(code)
    if @map[4].each_char.all? { |char| code.include?(char) }
      @map[9] = code.chars.sort.join
    elsif !@map[1].each_char.all? { |char| code.include?(char) }
      @map[6] = code.chars.sort.join
    else
      @map[0] = code.chars.sort.join
    end
  end

  def decode_five(code)
    p @map[1]
    if @map[1].each_char.all? { |char| code.each_char.include?(char) }
      @map[3] = code.chars.sort.join
    else
      puts "AMI BEING PRINTED"
      if code.each_char.all? { |char| @map[6].each_char.include?(char) }
        @map[5] = code.chars.sort.join
      else
        @map[2] = code.chars.sort.join
      end
    end
  end

  def map
    p @ten_codes

    determine_value(@ten_codes[0])
    determine_value(@ten_codes[1])
    determine_value(@ten_codes[2])
    determine_value(@ten_codes[9])
    determine_value(@ten_codes[6])
    determine_value(@ten_codes[7])
    determine_value(@ten_codes[8])
    determine_value(@ten_codes[3])
    determine_value(@ten_codes[4])
    determine_value(@ten_codes[5])
  end

  def render_map
    p @map
  end

  def transpose_map
    @map.invert
  end

  def get_values_from_output_values
    result = ""
    @output_values.each do |value|
      value = value.chars.sort.join
      puts "value is #{value}"
      result += @map.invert[value].to_s
    end
    result.to_i
  end
end

=begin
0 = 6 a, b, c, e, f, g
1 = 2 c, f
2 = 5 a, c, d, e, g
3 = 5 a, c, d, f, g
4 = 4 b, c, d, f
5 = 5 a, b, d, f, g
6 = 6 a, b, d, e, f, g
7 = 3 a, c, f
8 = 7 a, b, c, d, e, f, g
9 = 6 a, b, c, d, f, g

map = {
  2: 1
  4: 4
  3: 7
  7: 8
  6: [0, 6, 9]
  5: [2, 3, 5]
}

6
if it has the same 2 as the number 2 and also has 6 length then it can be a 0 or 9
if not then it is a 6

3
if it has the same 2 as the number 2 and also has 5 length then it is a 3
if not then it is a 2 or 5

9
if it has the same 4 as the number 4 and also has 6 length then it is a 9

0
if it has the same 3 as the number 7 and not the same 4 as the number 4 then it is a 0 and has 6 lenght


if it has 1 length less than a 6 then it is a 5



=end

file = File.open('day-8.txt')

data = file.read.split("\n")

# p data

the_ten = []
output_values = []

data.each do |line|  
  line = line.split(" | ")
  ten = line.first.split(" ")
  output_value = line.last.split(" ")
  the_ten << ten
  output_values << output_value
end

p output_values

p output_values.flatten.count { |ele| ele.size == 2 || ele.size == 3 || ele.size == 4 || ele.size == 7 }

p the_ten.first

newthing = Code.new(the_ten.first, output_values.first)

newthing.map

newthing.render_map

newthing.transpose_map


sum = 0
the_ten.size.times do |idx|
  newthing = Code.new(the_ten[idx], output_values[idx])
  newthing.map
  sum += newthing.get_values_from_output_values
end

p sum