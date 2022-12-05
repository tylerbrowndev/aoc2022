file_name = '1_input.txt'
input = File.read(file_name)


def part_1 input
  max = 0
  
  input.split(/\n\n/).each do |snacks|
    cur = 0
    snacks.split.each do |calories|
      cur += calories.to_i
    end
    if cur > max
      max = cur
    end
  end
  puts max
end

def part_2 input
  maxes = [0, 0, 0]

  input.split(/\n\n/).each do |snacks|
    cur = 0
    snacks.split.each do |calories|
      cur += calories.to_i
    end
    maxes.each_with_index do |max, index|
      if cur > max
        maxes[index] = cur
        maxes.sort!
        break
      end
    end
  end
  puts maxes.sum
end

part_1(input)
part_2(input)