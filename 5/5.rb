file_name = '5_input.txt'
input = File.read(file_name)

def part_1 input
  stacks = []
  crates, instructions = input.split(/\n\n/)
  crate_lines = crates.split(/\n/)
  last = crate_lines.pop
  num_stacks = last.strip[-1]
  num_stacks.to_i.times do
    stacks.push([])
  end
  crate_lines.reverse.each do |line|
    chunks = line.scan(/.{3,4}/)
    chunks.each_with_index do |chunk, index|
      chunk = chunk.gsub(/[\[, \]]/, '')
      if !chunk.empty?
        stacks[index].push(chunk)
      end
    end
  end

  instructions.split(/\n/).each do |line|
    chunks = line.split
    num_crates = chunks[1].to_i
    from_index = chunks[3].to_i - 1
    to_index = chunks[5].to_i - 1
    num_crates.times do
      crate = stacks[from_index].pop
      stacks[to_index].push(crate)
    end
  end
  message = ''
  stacks.each do |stack|
    message += stack.last
  end
  puts message
end

def part_2 input
  stacks = []
  crates, instructions = input.split(/\n\n/)
  crate_lines = crates.split(/\n/)
  last = crate_lines.pop
  num_stacks = last.strip[-1]
  num_stacks.to_i.times do
    stacks.push([])
  end
  crate_lines.reverse.each do |line|
    chunks = line.scan(/.{3,4}/)
    chunks.each_with_index do |chunk, index|
      chunk = chunk.gsub(/[\[, \]]/, '')
      if !chunk.empty?
        stacks[index].push(chunk)
      end
    end
  end

  instructions.split(/\n/).each do |line|
    chunks = line.split
    num_crates = chunks[1].to_i
    from_index = chunks[3].to_i - 1
    to_index = chunks[5].to_i - 1
    crates = stacks[from_index].pop(num_crates)
    stacks[to_index].concat(crates)
  end
  message = ''
  stacks.each do |stack|
    message += stack.last
  end
  puts message
end

part_1(input)
part_2(input)