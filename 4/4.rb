file_name = '4_input.txt'
input = File.read(file_name)

def part_1 input
  overlaps = 0
  input.split(/\n/).each do |line|
    assignment_1, assignment_2 = line.split(',')
    min_1, max_1 = assignment_1.split('-').map{ |n| n.to_i }
    min_2, max_2 = assignment_2.split('-').map{ |n| n.to_i }
    if (min_1 <= min_2 && max_1 >= max_2) || (min_2 <= min_1 && max_2 >= max_1)
      overlaps += 1
    end
  end
  puts overlaps
end

def part_2 input
  overlaps = 0
  input.split(/\n/).each do |line|
    assignment_1, assignment_2 = line.split(',')
    min_1, max_1 = assignment_1.split('-').map{ |n| n.to_i }
    min_2, max_2 = assignment_2.split('-').map{ |n| n.to_i }
    if (min_1 <= min_2 && max_1 >= min_2) \
      || (min_1 <= max_2 && max_1 >= max_2) \
      || (min_2 <= min_1 && max_2 >= min_1) \
      || (min_2 <= max_1 && max_2 >= max_1)
      overlaps += 1
    end
  end
  puts overlaps
end

part_1(input)
part_2(input)