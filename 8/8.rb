require 'set'

file_name = '8_input.txt'
input = File.read(file_name)

@grid = []

def part_1 input
  visible_coordinates = Set.new
  visible_trees = 0
  input.split(/\n/).each do |line|
    @grid.append(line.chars)
  end
  (0..@grid.size - 1).each do |i|
    max = -1
    (0..@grid[0].size - 1).each do |j|
      if @grid[i][j].to_i > max
        if !visible_coordinates.include? "#{i}-#{j}"
          visible_coordinates.add("#{i}-#{j}")
          visible_trees += 1
        end
        max = @grid[i][j].to_i
      end
    end
  end
  (@grid.size - 1).downto(0).each do |i|
    max = -1
    (@grid[0].size - 1).downto(0).each do |j|
      if @grid[i][j].to_i > max
        if !visible_coordinates.include? "#{i}-#{j}"
          visible_coordinates.add("#{i}-#{j}")
          visible_trees += 1
        end
        max = @grid[i][j].to_i
      end
    end
  end
  (0..@grid[0].size - 1).each do |j|
    max = -1
    (0..@grid.size - 1).each do |i|
      if @grid[i][j].to_i > max
        if !visible_coordinates.include? "#{i}-#{j}"
          visible_coordinates.add("#{i}-#{j}")
          visible_trees += 1
        end
        max = @grid[i][j].to_i
      end
    end
  end
  (@grid[0].size - 1).downto(0).each do |j|
    max = -1
    (@grid.size - 1).downto(0).each do |i|
      if @grid[i][j].to_i > max
        if !visible_coordinates.include? "#{i}-#{j}"
          visible_coordinates.add("#{i}-#{j}")
          visible_trees += 1
        end
        max = @grid[i][j].to_i
      end
    end
  end
  puts visible_trees
end

def part_2 input
  max_scenic_score = 0
  (0..@grid.size - 1).each do |i|
    (0..@grid[0].size - 1).each do |j|
      scenic_score = get_scenic_score i, j
      # puts "#{i}-#{j}"
      # puts scenic_score
      if scenic_score > max_scenic_score
        max_scenic_score = scenic_score
      end
    end
  end
  puts max_scenic_score
end

def get_scenic_score i, j
  height = @grid[i][j].to_i
  up = 0
  down = 0
  left = 0
  right = 0

  (i - 1).downto(0).each do |u|
    up += 1
    if height <= @grid[u][j].to_i
      break
    end
  end

  ((i + 1)..@grid.size - 1).each do |d|
    down += 1
    if height <= @grid[d][j].to_i
      break
    end
  end

  (j - 1).downto(0).each do |l|
    left += 1
    if height <= @grid[i][l].to_i
      break
    end
  end

  ((j + 1)..@grid[0].size - 1).each do |r|
    right += 1
    if height <= @grid[i][r].to_i
      break
    end
  end

  up * down * left * right
end

part_1(input)
part_2(input)