require 'open-uri'

list = URI.open('input5.txt').read

def arrays(input)
  stacks = input.split(/\n\n/)[0]
  all = [[], [], [], [], [], [], [], [], []]

  stacks.split(/\n/).each do |string|
    all[0] << string.chars[1]
    all[1] << string.chars[5]
    all[2] << string.chars[9]
    all[3] << string.chars[13]
    all[4] << string.chars[17]
    all[5] << string.chars[21]
    all[6] << string.chars[25]
    all[7] << string.chars[29]
    all[8] << string.chars[33]
  end

  all.each do |array|
    array.pop()
    array.delete(" ")
  end
  all
end

def moves(input)
  moves = input.split(/\n\n/)[1].split(/\n/)
  my_array = []
  moves.each do |move|
    array = []
    match_data = move.match(/^([a-z]+) (\d+) ([a-z]+) (\d+) ([a-z]+) (\d+)$/)
    array << match_data[2].to_i
    array << match_data[4].to_i
    array << match_data[6].to_i
    my_array << array
  end
  my_array
end

def actions(input)
  moves = moves(input)
  stacks = arrays(input)
  stacks.each { |stack| stack.reverse! }

  moves.each do |move|
    amount = move[0]
    from = move[1]
    to = move[2]
    if amount <= stacks[from - 1].length
      stacks[to - 1] << stacks[from - 1].pop(amount).reverse!
    else
      stacks[to - 1] << stacks[from - 1].pop(stacks[from - 1].length).reverse!
    end
  end
  stacks.each { |stack| stack.reverse! }
  p stacks
end

actions(list)
