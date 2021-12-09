# 3,4,3,1,2

file = File.open('day-6.txt')

lantern_fish_arr = file.readline.split(",").map(&:to_i)

p lantern_fish_arr.size

18.times do
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

p lantern_fish_arr.count {|fish| fish == 6} #1727
p lantern_fish_arr.count {|fish| fish == 8} #488



def find_result_after_x_days(num, days)
  if days <= num
    num - days
  else
    (num - days) % 7
  end
end

p find_result_after_x_days(3, 6)

# how many fish have been added due to 0?

def added_fish(num, days)
  num_fish = days / 7
  if days % 7 >= num
    num_fish += 1
  end
  num_fish
end

p added_fish(2, 256) 

# first fish added 37 fish
# second fish added 37 fish
# third fish added 37 fish
# fourth fish added 37 fish
# fifth fish added 37 fish

# 185 fish added after 256 days only for the 5 fish

# new fish starts at 9 so it adds 3 days only when it's born

# 300 vs 5 to start



# to get 0 it is num + multiples of 7

# 0 - 6 3
# 1 - 5 2
# 2 - 4 1
# 3 - 3 0
# 4 - 2 6
# 5 - 1 5
# 6 - 0 4
# 7 - 6 3
# 8 - 5 2
# 9 - 4 1
# 10 - 3  0
# 11 - 2  6
# 12 - 1  5
# 13 - 0  4


=begin
1 = 300
445
484
10 = 784
100 = 2113231
150 = 

445 - 300 = 145
484 - 445 = 39


=end