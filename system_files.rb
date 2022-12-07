require 'open-uri'

list = URI.open('input7.txt').read

def directory_array(input)
  my_array = input.split("$ ls")
  my_array.map! { |x| x.strip }
  my_array.map! { |x| x.split("\n") }
  my_array
end

def directory_hash(input)
  my_array = directory_array(input)
  my_hash = {}
  i = 0
  my_array.each do |element|
    break if i == my_array.length - 1
    ls = my_array[i + 1]
    key = element.last.split.last
    my_hash[key] = ls
    i += 1
  end
  my_hash
end

def iterate(hash)
  counter_array = []
  hash.each_value do |value|
    counter = 0
    value.each do |element|
      if element.include?("cd")
        next
      elsif element.include?("dir")
        key = element.split.last
        sub_hash = { "#{key}" => hash[key] }
        iterate(sub_hash)
      else
        match_data = element.match(/(\d+)/)
        counter += match_data[1].to_i
      end
    end
    counter_array << counter
  end
  counter_array
end

def sum(input)
  sum = 0
  my_hash = directory_hash(input)
  counter_array = iterate(my_hash)
  counter = counter_array.sum
  sum += counter if counter <= 100000
  sum
end

sum(list)
