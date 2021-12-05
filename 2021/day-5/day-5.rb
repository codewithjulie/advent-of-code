file = File.open('day-5.txt')

class Board

  def initialize(height, width)
    @grid = Array.new(height) { Array.new(width, 0) }
  end

  def plot(x, y)
    if x == 8 && y == 8
      print "here"
    end
    if @grid[y][x] == 0
      @grid[y][x] = 1
    else
      @grid[y][x] += 1
    end
  end

  def plot_map(x1, y1, x2, y2)
    p [x1, y1, x2, y2]
    if x1 == x2
      if x1 == 83
        return
      end
      if y1 < y2
        (y1..y2).each do |y|
          plot(x1, y)
        end
      else
        (y2..y1).each do |y|
          plot(x1, y)
        end
      end
    elsif y1 == y2
      if x1 == 83
        p "hi there 3"
      end
      if x1 < x2
        (x1..x2).each do |x|
          plot(x, y1)
        end
      else
        (x2..x1).each do |x|
          plot(x, y1)
        end
      end
    else
      if x1 == 83
        p "hi there 4"
      end
      if (x1 - x2).abs == (y1 - y2).abs
        if x2 == 83
          p "hi there"
        end
        if x1 < x2 && y1 < y2
          while x1 <= x2
            plot(x1, y1)
            x1 += 1
            y1 += 1
          end
        elsif x1 > x2 && y1 > y2
          while x1 >= x2
            plot(x1, y1)
            x1 -= 1
            y1 -= 1
          end
        elsif x1 < x2 && y1 > y2
          while x1 <= x2
            plot(x1, y1)
            x1 += 1
            y1 -= 1
          end
        elsif x1 > x2 && y1 < y2
          while x1 >= x2
            plot(x1, y1)
            x1 -= 1
            y1 += 1
          end
        end
      end
    end
  end 

  def count_2_plus
    @grid.flatten.count { |ele| ele >= 2 }
  end

  def render
    @grid.each do |row|
      p row
    end
  end

end



coordinates = file.read.split("\n")

# [0,9 -> 5,9] --> 0,9 1,9 2,9 3,9 4,9 5,9

#x1, y1, x2, y2

split_up = coordinates.first.split(",")

def get_points(coordinate)
  y1, x2 = coordinate[1].split(" -> ").map(&:to_i)
  x1 = coordinate.first.to_i
  y2 = coordinate.last.to_i
  return [x1, y1, x2, y2]
end

max_x = 0
max_y = 0

coordinates.each do|coordinate|
  coordinate = coordinate.split(",")
  x1, y1, x2, y2 = get_points(coordinate)
  if x2 > max_x
    max_x = x2
  end
  if x1 > max_x
    max_x = x1
  end
  if y2 > max_y
    max_y = y2
  end
  if y1 > max_y
    max_y = y1
  end
end

board = Board.new(max_x + 1, max_y + 1)
puts "max_x2 is #{max_x} and max_y2 is #{max_y}"
coordinates.each do |coordinate|
  coordinate = coordinate.split(",")
  x1, y1, x2, y2 = get_points(coordinate)
  board.plot_map(x1, y1, x2, y2)
end

p board.count_2_plus


