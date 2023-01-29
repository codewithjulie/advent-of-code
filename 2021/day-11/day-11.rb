file = File.open('day-11-short.txt')

data = file.readlines.map(&:strip).map

DATA = data.each do |row|
  row.split("").map(&:to_i)
end


DATA.unshift(Array.new(10, nil))
DATA.push(Array.new(10, nil))

DATA.each do |row|
  row.unshift(nil)
  row.push(nil)
end


def flash_neighbors(x, y)

  count = 1
  
  (x-1..x+1).each do |i|
    (y-1..y+1).each do |j|
      if DATA[i][j]
        DATA[i][j] += 1
        if DATA[i][j] == 10
          count += flash_neighbors(i, j)
        end
      end
    end
  end

  count
end

def reduce_to_zero
  DATA.each_with_index do |row, i|
    row.each_with_index do |ele, j|
      DATA[i][j] = 0 if DATA[i][j] && DATA[i][j] > 9
    end
  end
end

def flash?(value)
  value == 9
end

def render
  DATA.each do |row|
    p row
  end
end

def step
  DATA.each_with_index do |row, i|
    row.each_with_index do |ele, j|
      DATA[i][j] += 1 if ele != nil
    end
  end
end

def check_all_flash
  DATA.flatten.compact.all? { |ele| ele == 0}
end

count = 0
(0..).each do |index|
  DATA.each_with_index do |row, i|
    row.each_with_index do |ele, j|
      DATA[i][j] += 1 if ele
      if DATA[i][j] && DATA[i][j] == 10
        count += flash_neighbors(i, j)
      end
    end
  end
  reduce_to_zero
  if check_all_flash
    p index
    break
  end
end

render

