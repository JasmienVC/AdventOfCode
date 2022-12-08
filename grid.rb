require 'open-uri'

list = URI.open('input8.txt').read

def check(arr, x)
  arr.each do |y|
    break if y >= x
    true
  end
end

def increase(arr, j)
  if j == arr.length - 1
    view = 0
  else
    i = 1
    while i < arr.length - 1 - j
      break if arr[j + i] >= arr[j]
      i += 1
    end
    view = i
  end
  view
end

def decrease(arr, j)
  if j.zero?
    view = 0
  else
    i = 1
    while i < j
      break if arr[j - i] >= arr[j]
      i += 1
    end
    view = i
  end
  view
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
  counter
end

def score(input)
  tree_rows = rows(input)
  tree_columns = columns(input)
  scores = []
  tree_rows.each_with_index do |tree_row, j|
    tree_row.each_with_index do |tree, i|
      tree_column = tree_columns[i]
      left = decrease(tree_row, i)
      right = increase(tree_row, i)
      up = decrease(tree_column, j)
      down = increase(tree_column, j)
      score = up * down * left * right
      scores << score
    end
  end
  p scores.max
end

score(list)
