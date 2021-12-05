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


def bingo_rows(bingo_cards)
  bingo_cards.each do |card|
    unless card.nil?
      card.each do |row|
        if row.all? {|ele| ele.nil?}
          return true
        end
      end
    end
  end
  return false
end

def bingo_column(bingo_cards)
  bingo_cards.each do |card|
    unless card.nil?
      columns = card.transpose
      columns.each do |col|
        if col.all? {|ele| ele.nil?}
          return true
        end
      end
    end
  end
  return false
end

def find_num(bingo_card, num)
  unless bingo_card.nil?
    bingo_card.each_with_index do |row, idx1|
      row.each_with_index do |ele, idx2|
        if ele == num
          bingo_card[idx1][idx2] = nil
        end
      end
    end
  end
end

# real_card = [[22, 13, 17, 11, 0], [8, 2, 23, 4, 24], [21, 9, 14, 16, 7], [6, 10, 3, 18, 5], [1, 12, 20, 15, 19]]

# find_num(real_card, 7)
def bingo_row(row)
  row.all? {|ele| ele.nil?}
end
def bingo_card(card)
  unless card.nil?
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
  end
  return false
end

winning_num = -1

def keep_drawing(index, card, numbers_drawn)
  until bingo_card(card) || index > numbers_drawn.length - 1
    p card
    find_num(card, numbers_drawn[index])

    index += 1
  end
  return numbers_drawn[index - 1]
end

numbers_drawn.each_with_index do |num, index|
  bingo_cards.each_with_index do |card, index|
    unless card.nil?
      find_num(card, num)

      if bingo_rows(bingo_cards)
        bingo_cards[index] = nil
        redo
      end
      if bingo_column(bingo_cards)
        bingo_cards[index] = nil
        redo
      end
    end
  end
  if bingo_cards.count { |card| card.nil? } == bingo_cards.size - 1
    bingo_cards.each do |card|
      unless card.nil?
        winning_num = keep_drawing(index, card, numbers_drawn)
      end
    end
    break
  end
end


answer = (bingo_cards.compact.flatten.compact.sum) * winning_num

p [bingo_cards.compact.flatten.compact.sum, "sum"]

p [winning_num, "winning_num"]

p [bingo_cards.compact.size, "remaining cards"]


p answer

p bingo_cards.size