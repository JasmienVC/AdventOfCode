require 'open-uri'

list = URI.open('input14.txt').read

# paths = list.split(/\n/)
# coordinates = paths.map {|path| path.split(" -> ")}

# x = []
# y = []
# coordinates.each do |coordinate|
#   coordinate.each do |rock|
#     x << rock.split(",")[0]
#     y << rock.split(",")[1]
#   end
# end

# columns = [3,3,1,3,5]
# min = columns.min
# max = columns.max
# range = (min..max).to_a
# rows = [2,3,3,5,5]
# depth = rows.max

# i = 0
# while i <= depth do
#   rows.each_with_index do |row, y|
#     if row == i
#       rock = columns[y]
#   end
#   i += 1
# end
