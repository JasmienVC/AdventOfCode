require 'open-uri'

list = URI.open('input11.txt').read

def split(input)
  monkeys = input.split(/\n\n/)
  monkeys.each_with_index do |monkey, i|
    check = monkey.split(/\n/)
    items = check[1].split(',')
    first_item = items[0].split(/\s/).last.to_i
    items.shift()
    items.map! do |item|
      item.strip.to_i
    end
    p items # merge first item back in
    # monkey_i = []
  end
end

split(list)
