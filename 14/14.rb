file_name = '14_input.txt'
input = File.read(file_name)

def part_1 input
  grid = []
  width = 510
  height = 200
  sand_start_x = 500
  sand_start_y = 0
  row = Array.new(width) { '.' }
  height.times do
    grid.append(row.dup)
  end
  input.split(/\n/).each do |line|
    coordinates = line.split(' -> ')
    prev_x, prev_y = coordinates[0].split(',').map { |n| n.to_i }
    coordinates[1..coordinates.size].each do |coordinate|
      x, y = coordinate.split(',').map { |n| n.to_i }
      if x == prev_x
        if prev_y < y
          range = prev_y..y
        else
          range = y..prev_y
        end
        range.each do |index|
          grid[index][x] = '#'
        end
      else
        if prev_x < x
          range = prev_x..x
        else
          range = x..prev_x
        end
        range.each do |index|
          grid[y][index] = '#'
        end
      end
      prev_x = x
      prev_y = y
    end
  end
  sand_stopped = 0
  while true
    sand_was_stopped = false
    x = sand_start_x
    y = sand_start_y
    while y < height - 1
      if grid[y + 1][x] == '#'
        if grid[y + 1][x - 1] != '#'
          x -= 1
        elsif grid[y + 1][x + 1] != '#'
          x += 1
        else
          grid[y][x] = '#'
          sand_stopped += 1
          sand_was_stopped = true
          break
        end
      end
      y += 1
    end
    break if !sand_was_stopped
  end
  puts sand_stopped
end

def part_2 input
  grid = []
  width = 1000
  height = 200
  sand_start_x = 500
  sand_start_y = 0
  max_y = 0
  row = Array.new(width) { '.' }
  height.times do
    grid.append(row.dup)
  end
  input.split(/\n/).each do |line|
    coordinates = line.split(' -> ')
    prev_x, prev_y = coordinates[0].split(',').map { |n| n.to_i }
    coordinates[1..coordinates.size].each do |coordinate|
      x, y = coordinate.split(',').map { |n| n.to_i }
      if y > max_y
        max_y = y
      end
      if x == prev_x
        if prev_y < y
          range = prev_y..y
        else
          range = y..prev_y
        end
        range.each do |index|
          grid[index][x] = '#'
        end
      else
        if prev_x < x
          range = prev_x..x
        else
          range = x..prev_x
        end
        range.each do |index|
          grid[y][index] = '#'
        end
      end
      prev_x = x
      prev_y = y
    end
  end
  height = max_y + 2
  (0..width - 1).each do |x|
    grid[height][x] = '#'
  end
  sand_stopped = 0
  while grid[sand_start_y][sand_start_x] != '#'
    x = sand_start_x
    y = sand_start_y
    while y < height
      if grid[y + 1][x] == '#'
        if grid[y + 1][x - 1] != '#'
          x -= 1
        elsif grid[y + 1][x + 1] != '#'
          x += 1
        else
          grid[y][x] = '#'
          sand_stopped += 1
          break
        end
      end
      y += 1
    end
  end
  puts sand_stopped
end

part_1(input)
part_2(input)