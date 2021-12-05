file = File.open('day-4.txt')

numbers_drawn = file.readline.chomp.split(",").map(&:to_i)

data = file.readlines

cards = []

data.each do |row| 
  if row != "\n"
    cards << row.split(" ").map(&:to_i)
  end
end

bingo_cards = []
card = []

cards.size.times do |idx|
  card << cards[idx]
  if (idx + 1) % 5 == 0
    bingo_cards << card
    card = []
  end
end


def bingo_row(bingo_cards)
  bingo_cards.each do |card|
    card.each do |row|
      if row.all? {|ele| ele.nil?}
        return true
      end
    end
  end
  return false
end

def bingo_column(bingo_cards)
  bingo_cards.each do |card|
    columns = card.transpose
    columns.each do |col|
      if col.all? {|ele| ele.nil?}
        return true
      end
    end
  end
  return false
end

def find_num(bingo_card, num)
  bingo_card.each_with_index do |row, idx1|
    row.each_with_index do |ele, idx2|
      if ele == num
        bingo_card[idx1][idx2] = nil
      end
    end
  end
end

# real_card = [[22, 13, 17, 11, 0], [8, 2, 23, 4, 24], [21, 9, 14, 16, 7], [6, 10, 3, 18, 5], [1, 12, 20, 15, 19]]

# find_num(real_card, 7)

winning_num = -1
numbers_drawn.each do |num|
  bingo_cards.each do |card|
    find_num(card, num)
  end
  if bingo_row(bingo_cards)
    puts "bingo by row"
    winning_num = num
    break
  end
  if bingo_column(bingo_cards)
    puts "bingo by column"
    winning_num = num
    p num
    break
  end
end
def bingo_row(row)
  row.all? {|ele| ele.nil?}
end

def bingo_card(card)
  p "testing"
  card.each do |row|
    if bingo_row(row)
      p "winning"
      return true
    end
  end
  columns = card.transpose
  columns.each do |row|
    if bingo_row(row)
      p "winning"
      return true
    end
  end
  return false
end

answer = -1

bingo_cards.each do |card|
  if bingo_card(card)
    p "hello"
    p card.flatten.compact.sum
    p "hello #{winning_num}"
    answer = card.flatten.compact.sum * winning_num
  end
end


p answer