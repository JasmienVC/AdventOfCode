require 'open-uri'
list = URI.open('input10.txt').read

def signal(input)
  instructions = input.split(/\n/)
  cycles = [20, 60, 100, 140, 180, 220]
  signals = []
  cycles.each do |cycle|
    round = 0
    register = 1
    instructions.each do |instruction|
      if instruction == "noop"
        round += 1
      else
        round += 2
        register += instruction.split.last.to_i if round < cycle
      end
    end
    signals << register * cycle
  end
  p signals.sum
end

signal(list)
