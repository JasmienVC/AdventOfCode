require 'open-uri'

list = URI.open('input11.txt').read

def item_collection(input)
  monkeys = input.split(/\n\n/)
  collection = []
  monkeys.each do |monkey|
    check = monkey.split(/\n/)
    items = check[1].split(',')
    first_item = items[0].split(/\s/).last.to_i
    items.shift
    items.map! do |item|
      item.strip.to_i
    end
    items.unshift(first_item)
    collection << items
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

# def test(input, result, index)
#   true_options = true_option(input)
#   false_options = false_option(input)
#   dividers = divider(input)
#   collection = item_collection(input)
#   if (result % dividers[index]).zero?
#     collection[true_options[index]] << result
#   else
#     collection[false_options[index]] << result
#   end
#   collection[index].delete(result)
#   p collection
# end

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
  monkey_0 = 0
  monkey_1 = 0
  monkey_2 = 0
  monkey_3 = 0
  monkey_4 = 0
  monkey_5 = 0
  monkey_6 = 0
  monkey_7 = 0
  values = []

  value_array.each do |round|
    monkey_0 += round[0]
    monkey_1 += round[1]
    monkey_2 += round[2]
    monkey_3 += round[3]
    monkey_4 += round[4]
    monkey_5 += round[5]
    monkey_6 += round[6]
    monkey_7 += round[7]
  end
  values << monkey_0
  values << monkey_1
  values << monkey_2
  values << monkey_3
  values << monkey_4
  values << monkey_5
  values << monkey_6
  values << monkey_7
  max = values.max
  values.delete(max)
  second = values.max
  p max * second
end

count(list)
