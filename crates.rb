require 'open-uri'

list = URI.open('input5.txt').read

moves = list.split(/\n\n/)[1]

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
  p all
end

arrays(list)
