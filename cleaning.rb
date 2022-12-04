require 'open-uri'

list = URI.open('input4.txt').read

def ranges(input)
  my_array = []
  duos = input.split(/\n/)
  duos.each do |duo|
    sub_arrays = duo.split(",")
    sub_arrays.each do |sub_array|
      range = Range.new(sub_array.split("-").map(&:to_i)[0], sub_array.split("-").map(&:to_i)[1])
      my_array << range.to_a
    end
  end
  my_array
end

def group(input)
  my_array = []
  ranges = ranges(input)
  until ranges.length < 2
    my_array << ranges.first(2)
    ranges.shift(2)
  end
  my_array
end

def match(input)
  counter = 0
  my_array = group(input)
  my_array.each do |array|
    first_range = array[0][0] .. array[0][-1]
    second_range = array[1][0] .. array[1][-1]

    x = 0
    array[0].each do |number|
      x += 1 if second_range.cover?(number)
    end
    counter += 1 unless x.zero?

    y = 0
    array[1].each do |number|
      y += 1 if first_range.cover?(number)
    end
    counter += 1 unless y.zero? || !x.zero?
    # counter += 1 if array[0].cover?(array[1]) || array[1].cover?(array[0])
  end
  puts counter
end

match(list)
