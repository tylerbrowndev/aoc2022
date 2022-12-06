require 'set'

file_name = '3_input.txt'
input = File.read(file_name)

def part_1 input
  val = 0
  input.split(/\n/).each do |line|
    half_index = line.size / 2
    first_compartment = line[0, half_index]
    second_compartment = line[half_index, line.size]
    first_compartment_set = first_compartment.chars.to_set
    second_compartment_set = second_compartment.chars.to_set
    misplaced_item = first_compartment_set.intersection(second_compartment_set).first
    if misplaced_item == misplaced_item.downcase
      val += misplaced_item.ord - 96
    else
      val += misplaced_item.ord - 38
    end
  end
  puts val
end

def part_2 input
  val = 0
  i = 0
  lines = input.split(/\n/)
  first_sack = Set.new
  second_sack = Set.new
  third_sack = Set.new
  while i < lines.size
    first_sack = lines[i].chars.to_set
    i += 1
    second_sack = lines[i].chars.to_set
    i += 1
    third_sack = lines[i].chars.to_set
    i += 1
    badge = first_sack.intersection(second_sack).intersection(third_sack).first
    if badge == badge.downcase
      val += badge.ord - 96
    else
      val += badge.ord - 38
    end
    first_sack.clear
    second_sack.clear
    third_sack.clear
  end
  puts val
end

part_1(input)
part_2(input)