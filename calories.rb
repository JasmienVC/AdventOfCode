require 'open-uri'

list = URI.open('input.txt').read


def array(input)
  my_array = []
  test = input.split(/\n\n/)
  test.each do |x|
    unless x.include?("\n")
      my_array << [x.strip.to_i]
    else
      sub_array = x.split(/\n/)
      integer_array = sub_array.map do |y|
        y.to_i
      end
      my_array << integer_array
    end
  end
  my_array
end

def calories(input)
  my_array = array(input)
  counter = 0
  my_array.each do |sub_array|
    counter = sub_array.sum if sub_array.sum > counter
  end
  counter
end

def top_three(input)
  my_array = array(input)
  calories = []
  my_array.each do |sub_array|
    calories << sub_array.sum
  end
  puts calories.max(3).sum
end

top_three(list)
