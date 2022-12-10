file_name = '10_input.txt'
input = File.read(file_name)

@grid = []

def part_1 input
  cycle = 0
  x = 1
  sum = 0
  input.split(/\n/).each do |line|
    instruction, n = line.split
    case instruction
    when 'noop'
      cycle += 1
      sum += check_cycle cycle, x
    when 'addx'
      cycle += 1
      sum += check_cycle cycle, x
      cycle += 1
      sum += check_cycle cycle, x
      x += n.to_i
    end
  end
  puts sum
end

def part_2 input
  cycle = 0
  x = 1
  row = Array.new(40) { '.' }
  6.times do
    @grid.append(row.dup)
  end
  input.split(/\n/).each do |line|
    instruction, n = line.split
    case instruction
    when 'noop'
      draw_pixel cycle, x
      cycle += 1
    when 'addx'
      draw_pixel cycle, x
      cycle += 1
      draw_pixel cycle, x
      cycle += 1
      x += n.to_i
    end
  end
  @grid.each do |r|
    puts r.join
  end
end

def check_cycle cycle, x
  if [20, 60, 100, 140, 180, 220].include? cycle
    cycle * x
  else
    0
  end
end

def draw_pixel cycle, x
  if (x - cycle % 40).abs <= 1
    i = cycle / 40
    j = cycle % 40
    @grid[i][j] = '#'
  end
end

part_1(input)
part_2(input)