require 'open-uri'

list = URI.open('input7.txt').read

def directory_array(input)
  my_array = input.split('$ ls')
  my_array.map!(&:strip)
  my_array.map! { |x| x.split("\n") }
  my_array
end

def directory_hash(input)
  my_array = directory_array(input)
  my_hash = {}
  i = 0
  my_array.each do |element|
    break if i == my_array.length - 1

    key = "dir #{element.last.split.last}"
    my_hash[key] = my_array[i + 1]
    i += 1
  end
  my_hash
end

def find_element(input, key)
  my_hash = directory_hash(input)
  my_hash["dir #{key}"]
end

def iterate(input, arr)
  numbers ||= []
  arr.each do |el|
    next if el.include?('cd')

    if el.include?('dir')
      key = el.split.last
      sub_arr = find_element(input, key)
      dir_numbers = numbers
      dir_numbers << iterate(input, sub_arr)
      numbers << dir_numbers
    else
      match_data = el.match(/(\d+)/)
      numbers << match_data[1].to_i
    end
    p numbers
  end
  numbers
end

def sum(input)
  sum = 0
  my_hash = directory_hash(input)
  my_hash.each_value do |value|
    counter = 0
    numbers = iterate(input, value)
    counter += numbers.sum
    sum += counter if counter <= 100_000
  end
  sum
end

sum(list)
