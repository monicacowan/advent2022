#dec-02.rb

# first, read in all the rounds
# Look up the corresponding combo, add to total score
# A, X rock: 1
# B, Y Paper: 2
# C, Z Scissors: 3

combinations = {
  'A X' => 4,
  'A Y' => 8,
  'A Z' => 3,
  'B X' => 1,
  'B Y' => 5,
  'B Z' => 9,
  'C X' => 7,
  'C Y' => 2,
  'C Z' => 6,
}

total_score = 0

IO.foreach('dec-02-input.txt') do |round|
  if combinations[round.strip]
    total_score += combinations[round.strip]
  else
    puts round
  end
end

puts "part 1: #{total_score}"

# part two
# X = lose
# Y = draw
# Z = win

# rock: 1
# Paper: 2
# Scissors: 3

# rock
a_outcomes = {
  'X' => 3, # scissors
  'Y' => 4, # rock
  'Z' => 8, # paper
}

# PAPER
b_outcomes = {
  'X' => 1, # ROCK
  'Y' => 5, # paper
  'Z' => 9, # scissors
}

# scissors
c_outcomes = {
  'X' => 2, # paper
  'Y' => 6, # scissors
  'Z' => 7, # rock
}

outcomes = {
  'A' => a_outcomes,
  'B' => b_outcomes,
  'C' => c_outcomes,
}

total_score = 0
IO.foreach('dec-02-input.txt') do |round|
  inputs = round.strip.split(' ')
  opponent_play = inputs[0]
  desired_outcome = inputs[1]
  if outcomes[opponent_play][desired_outcome]
    total_score += outcomes[opponent_play][desired_outcome]
  else
    puts inputs
  end
end

puts "part two: #{total_score}"