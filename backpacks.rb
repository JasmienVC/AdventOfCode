require 'open-uri'

list = URI.open('input3.txt').read

def split_and_compare(input)
  my_array = []
  backpacks = input.split(/\n/)
  backpacks.each do |backpack|
    i = backpack.length / 2
    part1, part2 = backpack.slice!(0...i), backpack
    common = part1.chars.find {|letter| part2.chars.include?(letter)}
    my_array << common
  end
  my_array
end

def points(input)
  my_array = split_and_compare(input)
  counter = 0
  lowercase = ('a'..'z').to_a
  uppercase = ('A'..'Z').to_a
  letters = lowercase.concat(uppercase)
  my_array.each do |letter|
    points = letters.index(letter) + 1
    counter += points
  end
  counter
end

def group(input)
  my_array = []
  backpacks = input.split(/\n/)
  groups = backpacks.each_slice(3).to_a
  groups.each do |group|
    common = group[0].chars & group[1].chars
    common_all = common & group[2].chars
    my_array << common_all
  end
  my_array.flatten
end

def group_points(input)
  my_array = group(input)
  counter = 0
  lowercase = ('a'..'z').to_a
  uppercase = ('A'..'Z').to_a
  letters = lowercase.concat(uppercase)
  my_array.each do |letter|
    points = letters.index(letter) + 1
    counter += points
  end
  puts counter
end

group_points(list)
