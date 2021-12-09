file = File.open('day-9-small.txt')

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
            low_points << matrix[row][col]
          end
        end
      end
    elsif row == 0 && col == matrix.first.length - 1 
      if matrix[row][col-1] > matrix[row][col]
        if matrix[row+1][col] > matrix[row][col]
          if matrix[row+1][col-1] > matrix[row][col]
            low_points << matrix[row][col]
          end
        end
      end
    elsif row == matrix.length - 1 && col == 0 
      if matrix[row][col+1] > matrix[row][col]
        if matrix[row-1][col] > matrix[row][col]
          if matrix[row-1][col+1] > matrix[row][col]
            low_points << matrix[row][col]
          end
        end
      end
    elsif row == matrix.length - 1 && col == matrix.first.length - 1
      if matrix[row][col-1] > matrix[row][col]
        if matrix[row-1][col] > matrix[row][col]
          if matrix[row-1][col-1] > matrix[row][col]
            low_points << matrix[row][col]
          end
        end
      end
    elsif row == 0
      if matrix[row][col-1] > matrix[row][col]
        if matrix[row][col+1] > matrix[row][col]
          if matrix[row+1][col-1] > matrix[row][col]
            if matrix[row+1][col] > matrix[row][col]
              if matrix[row+1][col+1] > matrix[row][col]
                low_points << matrix[row][col]
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
                low_points << matrix[row][col]
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
                low_points << matrix[row][col]
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
                low_points << matrix[row][col]
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
                      low_points << matrix[row][col]
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

p low_points

p low_points.sum + low_points.size