# 3,4,3,1,2

file = File.open('day-6.txt')

lantern_fish_arr = file.readline.split(",").map(&:to_i)

256.times do
  lantern_fish_arr.each_with_index do |fish, idx|
    if fish == 0
      lantern_fish_arr[idx] = 6
      lantern_fish_arr << 9
    else
      lantern_fish_arr[idx] -= 1
    end
  end
end

p lantern_fish_arr.size

