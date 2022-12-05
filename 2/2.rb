file_name = '2_input.txt'
input = File.read(file_name)

@points = {
  'A': 1,
  'X': 1,
  'B': 2,
  'Y': 2,
  'C': 3,
  'Z': 3
}

def part_1 input
  score = 0
  winning_matchups = {
    'X': 'C',
    'Y': 'A',
    'Z': 'B'
  }
  input.split(/\n/).each do |line|
    opponent_choice, player_choice = line.split
    if @points[opponent_choice.to_sym] == @points[player_choice.to_sym]
      score += 3
    elsif winning_matchups[player_choice.to_sym] == opponent_choice
        score += 6
    end
    score += @points[player_choice.to_sym]
  end
  puts score
end

def part_2 input
  score = 0
  choices = ['A', 'B', 'C']
  matchups = {
    'X': { offset: 1, score: 0},
    'Y': { offset: 0, score: 3},
    'Z': { offset: 2, score: 6}
  }
  input.split(/\n/).each do |line|
    opponent_choice, match_result = line.split
    puts (choices.index(opponent_choice) + matchups[match_result.to_sym][:offset]) % 3
    player_choice = choices[(choices.index(opponent_choice) + matchups[match_result.to_sym][:offset]) % 3]
    puts opponent_choice + ' ' + match_result
    puts player_choice
    puts @points[player_choice.to_sym] + matchups[match_result.to_sym][:score]
    score += @points[player_choice.to_sym]
    score += matchups[match_result.to_sym][:score]
  end
  puts score
end

part_1(input)
part_2(input)