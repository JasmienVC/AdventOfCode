require 'open-uri'

list = URI.open('input6.txt').read

def array(input)
  array = input.chars
  array.delete_at(-1)
  array
end

def find_marker(input)
  array = array(input)
  i = 0
  while i <= array.length - 14 do
    combi = []
    14.times { |j| combi += [array[i + j]]}
    # combi += [array[i + j], array[i + 1], array[i + 2], array[i + 3]]
    if combi.uniq.count == 14
      puts i + 14
      break
    end
    i += 1
  end
end

find_marker(list)
