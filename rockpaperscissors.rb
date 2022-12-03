require 'open-uri'

list = URI.open('input2.txt').read

def moves(input)
  player = []
  rounds = input.split(/\n/)
  rounds.each do |round|
    player << round.split[1]
  end
  player
end

def opponent_moves(input)
  opponent = []
  rounds = input.split(/\n/)
  rounds.each do |round|
    opponent << round.split[0]
  end
  opponent
end

def shape_score(input)
  counter = 0
  moves = moves(input)
  moves.each do |move|
    counter += 1 if move == "X"
    counter += 2 if move == "Y"
    counter += 3 if move == "Z"
  end
  counter
end

def round_outcome(input)
  counter = 0
  moves = moves(input)
  opponent_moves = opponent_moves(input)
  moves.each_with_index do |move, i|
    case move
    when "X"
      counter += 3 if opponent_moves[i] == "A"
      counter += 6 if opponent_moves[i] == "C"
    when "Y"
      counter += 3 if opponent_moves[i] == "B"
      counter += 6 if opponent_moves[i] == "A"
    when "Z"
      counter += 3 if opponent_moves[i] == "C"
      counter += 6 if opponent_moves[i] == "B"
    end
  end
  counter
end

def total_score(input)
  shape_score = shape_score(input)
  round_outcome = round_outcome(input)
  total = shape_score + round_outcome
  total
end

puts total_score(list)
