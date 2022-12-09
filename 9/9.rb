require 'set'

file_name = '9_input.txt'
input = File.read(file_name)

def part_1 input
  t_x = 0
  t_y = 0
  h_x = 0
  h_y = 0
  tail_positions = Set.new
  tail_positions.add("#{t_x}-#{t_y}")

  input.split(/\n/).each do |line|
    dir, num = line.split
    num.to_i.times do
      case dir
      when 'U'
        h_y += 1
      when 'D'
        h_y -= 1
      when 'R'
        h_x += 1
      when 'L'
        h_x -= 1
      end
      x_dist = h_x - t_x
      y_dist = h_y - t_y
      total_distance = x_dist.abs + y_dist.abs
      if (total_distance == 2 && (x_dist == 0 || y_dist == 0)) || total_distance > 2
        if x_dist > 0
          t_x += 1
        elsif x_dist < 0
          t_x -= 1
        end

        if y_dist > 0
          t_y += 1
        elsif y_dist < 0
          t_y -= 1
        end
        tail_positions.add("#{t_x}-#{t_y}")
      end
    end
  end
  puts tail_positions.size
end

def part_2 input
  positions = []
  10.times do
    positions.append([0, 0])
  end
  tail_positions = Set.new
  tail_positions.add("0-0")

  input.split(/\n/).each do |line|
    dir, num = line.split
    num.to_i.times do
      case dir
      when 'U'
        positions[0][1] += 1
      when 'D'
        positions[0][1] -= 1
      when 'R'
        positions[0][0] += 1
      when 'L'
        positions[0][0] -= 1
      end

      (1..9).each do |index|
        x_dist = positions[index - 1][0] - positions[index][0]
        y_dist = positions[index - 1][1] - positions[index][1]
        total_distance = x_dist.abs + y_dist.abs
        if (total_distance == 2 && (x_dist == 0 || y_dist == 0)) || total_distance > 2
          if x_dist > 0
            positions[index][0] += 1
          elsif x_dist < 0
            positions[index][0] -= 1
          end

          if y_dist > 0
            positions[index][1] += 1
          elsif y_dist < 0
            positions[index][1] -= 1
          end
          tail_positions.add("#{positions[index][0]}-#{positions[index][1]}") if index == 9
        end
      end
    end
  end
  puts tail_positions.size
end

part_1(input)
part_2(input)