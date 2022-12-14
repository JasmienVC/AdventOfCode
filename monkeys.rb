require 'open-uri'
list = URI.open('input11.txt').read

def item_collection(input)
  monkeys = input.split(/\n\n/)
  collection = []
  monkeys.each do |monkey|
    items = monkey.split(/\n/)[1]
    item_arr = items.split(',')
    first_item = item_arr[0].split(/\s/).last.to_i
    item_arr.shift
    item_arr.map! do |item|
      item.strip.to_i
    end
    item_arr.unshift(first_item)
    collection << item_arr
  end
  collection
end

def operations(input)
  monkeys = input.split(/\n\n/)
  operations = []
  monkeys.each do |monkey|
    check = monkey.split(/\n/)
    operation = check[2].split('= ')[1]
    operations << operation
  end
  operations
end

def divider(input)
  monkeys = input.split(/\n\n/)
  dividers = []
  monkeys.each do |monkey|
    check = monkey.split(/\n/)
    divider = check[3].split.last
    dividers << divider.to_i
  end
  dividers
end

def true_option(input)
  monkeys = input.split(/\n\n/)
  true_options = []
  monkeys.each do |monkey|
    check = monkey.split(/\n/)
    true_option = check[4].split.last
    true_options << true_option.to_i
  end
  true_options
end

def false_option(input)
  monkeys = input.split(/\n\n/)
  false_options = []
  monkeys.each do |monkey|
    check = monkey.split(/\n/)
    false_option = check[5].split.last
    false_options << false_option.to_i
  end
  false_options
end

def remove_zeros(number)
  my_array = number.to_s.chars.map(&:to_i)
  while my_array.last.zero?
    my_array.pop
  end
  my_array.join.to_i
end

def round(input)
  collection = item_collection(input)
  operations = operations(input)
  true_options = true_option(input)
  false_options = false_option(input)
  dividers = divider(input)
  value_array = []
  20.times do
    sub_array = []
    collection.each_with_index do |monkey, i|
      value = 0
      monkey.map do |item|
        value += 1
        new_level = operations[i].gsub('old', item.to_s)
        array = new_level.split
        first = array.first.to_i
        last = array.last.to_i
        operator = array[1]
        item = first * last if operator == '*'
        item = first + last if operator == '+'
        item /= 3

        if (item % dividers[i]).zero?
          collection[true_options[i]] << item
        else
          collection[false_options[i]] << item
        end
        collection[i] = []
      end
      sub_array << value
      collection
    end
    value_array << sub_array
  end
  value_array
end

def count(input)
  value_array = round(input)
  monkey_array = [0, 0, 0, 0, 0, 0, 0, 0]
  i = 0
  while i < monkey_array.length
    value_array.each do |round|
      monkey_array[i] += round[i]
    end
    i += 1
  end
  max = monkey_array.max
  monkey_array.delete(max)
  p max * monkey_array.max
end

count(list)
