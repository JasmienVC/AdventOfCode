require 'open-uri'
list = URI.open('input10.txt').read

# def signal(input)
#   instructions = input.split(/\n/)
#   cycles = [20, 60, 100, 140, 180, 220]
#   signals = []
#   cycles.each do |cycle|
#     round = 0
#     register = 1
#     instructions.each do |instruction|
#       if instruction == "noop"
#         round += 1
#       else
#         round += 2
#         register += instruction.split.last.to_i if round < cycle
#       end
#     end
#     signals << register * cycle
#   end
#   p signals.sum
# end

def signal(input)
  instructions = input.split(/\n/)
  register = 2
  round = 0
  signals = []
  my_array = []

  instructions.each do |instruction|
    if round == 40
      signals << my_array
      my_array = []
      round = 0
    end

    sprite = [register - 1, register, register + 1]
    round += 1
    my_array << '#' if sprite.include?(round)
    my_array << '.' unless sprite.include?(round)
    next if instruction == 'noop'

    round += 1
    register += instruction.split.last.to_i
    my_array << '#' if sprite.include?(round)
    my_array << '.' unless sprite.include?(round)
  end
  signals << my_array
  signals.each { |signal| p signal }
end

signal(list)
