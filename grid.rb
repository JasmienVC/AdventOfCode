require 'open-uri'

list = URI.open('input8.txt').read

def check(arr, x)
  arr.each do |y|
    break if y >= x
    true
  end
end

def rows(input)
  strings = input.split("\n")
  rows = []
  strings.each do |string|
    rows << string.chars
  end
  rows.map! do |row|
    row.map! { |x| x.to_i }
  end
  rows
end

def columns(input)
  rows = rows(input)
  columns = []
  i = 0
  length = rows.first.length
  while i < length
    rows.each do |row|
      columns << row[i].to_i
    end
    i += 1
  end
  columns = columns.each_slice(length).to_a
  columns
end

def visible(input)
  counter = 0
  tree_rows = rows(input)
  tree_columns = columns(input)
  tree_rows.each_with_index do |tree_row, j|
    tree_row.each_with_index do |tree, i|
      tree_column = tree_columns[i]
      up = tree_column.slice(0...j)
      down = tree_column.slice((j + 1)..(tree_column.length))
      left = tree_row.slice(0...i)
      right = tree_row.slice((i + 1)..(tree_row.length))
      counter += 1 if check(left, tree) || check(right, tree) || check(up, tree) || check(down, tree)
    end
  end
  p counter
end

visible(list)
