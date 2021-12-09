file = File.open('day-9.txt')

rows = file.read.split("\n")

matrix = []

rows.each do |row|
  matrix << row.each_char.map(&:to_i)
end

low_points = []

matrix.size.times do |row|
  matrix.first.size.times do |col|
    if row == 0 && col == 0 
      if matrix[row+1][col] > matrix[row][col]
        if matrix[row][col+1] > matrix[row][col]
          if matrix[row+1][col+1] > matrix[row][col]
            low_points << [matrix[row][col], row, col]
          end
        end
      end
    elsif row == 0 && col == matrix.first.length - 1 
      if matrix[row][col-1] > matrix[row][col]
        if matrix[row+1][col] > matrix[row][col]
          if matrix[row+1][col-1] > matrix[row][col]
            low_points << [matrix[row][col], row, col]
          end
        end
      end
    elsif row == matrix.length - 1 && col == 0 
      if matrix[row][col+1] > matrix[row][col]
        if matrix[row-1][col] > matrix[row][col]
          if matrix[row-1][col+1] > matrix[row][col]
            low_points << [matrix[row][col], row, col]
          end
        end
      end
    elsif row == matrix.length - 1 && col == matrix.first.length - 1
      if matrix[row][col-1] > matrix[row][col]
        if matrix[row-1][col] > matrix[row][col]
          if matrix[row-1][col-1] > matrix[row][col]
            low_points << [matrix[row][col], row, col]
          end
        end
      end
    elsif row == 0
      if matrix[row][col-1] > matrix[row][col]
        if matrix[row][col+1] > matrix[row][col]
          if matrix[row+1][col-1] > matrix[row][col]
            if matrix[row+1][col] > matrix[row][col]
              if matrix[row+1][col+1] > matrix[row][col]
                low_points << [matrix[row][col], row, col]
              end
            end
          end
        end
      end
    elsif row == matrix.length - 1
      if matrix[row][col-1] > matrix[row][col]
        if matrix[row][col+1] > matrix[row][col]
          if matrix[row-1][col-1] > matrix[row][col]
            if matrix[row-1][col] > matrix[row][col]
              if matrix[row-1][col+1] > matrix[row][col]
                low_points << [matrix[row][col], row, col]
              end
            end
          end
        end
      end
    elsif col == 0
      if matrix[row-1][col] > matrix[row][col]
        if matrix[row+1][col] > matrix[row][col]
          if matrix[row-1][col+1] > matrix[row][col]
            if matrix[row][col+1] > matrix[row][col]
              if matrix[row+1][col+1] > matrix[row][col]
                low_points << [matrix[row][col], row, col]
              end
            end
          end
        end
      end
    elsif col == matrix.first.length - 1
      if matrix[row-1][col] > matrix[row][col]
        if matrix[row+1][col] > matrix[row][col]
          if matrix[row-1][col-1] > matrix[row][col]
            if matrix[row][col-1] > matrix[row][col]
              if matrix[row+1][col-1] > matrix[row][col]
                low_points << [matrix[row][col], row, col]
              end
            end
          end
        end
      end
    else
      if matrix[row+1][col+1] > matrix[row][col]
        if matrix[row+1][col] > matrix[row][col]
          if matrix[row+1][col-1] > matrix[row][col]
            if matrix[row][col+1] > matrix[row][col]
              if matrix[row][col-1] > matrix[row][col]
                if matrix[row-1][col] > matrix[row][col]
                  if matrix[row-1][col-1] > matrix[row][col]
                    if matrix[row-1][col+1] > matrix[row][col]
                      low_points << [matrix[row][col], row, col]
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

MATRIX_CLONE = matrix.clone

def get_neighbors(row, col)
  results = []
  if col > 0
    results << [MATRIX_CLONE[row][col-1], row, col-1]
  end
  if col < MATRIX_CLONE.first.length - 1
    results << [MATRIX_CLONE[row][col+1], row, col+1]
  end
  if row < MATRIX_CLONE.length - 1
    results << [MATRIX_CLONE[row+1][col], row+1, col]
  end
  if row > 0
    results << [MATRIX_CLONE[row-1][col], row-1, col]
  end
  p results.filter { |result| result.first < 9 }
end

def remove_dupe_neighbors(neighbors)
  neighbors.uniq!
end

basins = []
low_points.each do |low_point|
  p low_point
  basin = [low_point.first]
  row, col = low_point[1], low_point[2]

  MATRIX_CLONE[row][col] = 9


  neighbors = get_neighbors(row, col)
  p neighbors

  until neighbors.empty?
    remove_dupe_neighbors(neighbors)
    neighbor = neighbors.first
    p neighbor
    if neighbor.first && neighbor.first < 9
      p neighbor.first
      basin << neighbor.first
      MATRIX_CLONE[neighbor[1]][neighbor[2]] = 9
      neighbors += get_neighbors(neighbor[1], neighbor[2])
    end

    neighbors.shift
  end

  basins << basin
end

p basins.sort_by! { |arr| arr.size }

top_three = basins.last(3)

count = 0
top_three.each do |top|
  puts top.size
end
