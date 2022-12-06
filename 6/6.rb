file_name = '6_input.txt'
input = File.read(file_name)

def part_1 input
  i = 0
  while i < input.size
    chunk = input[i, 4]
    if chunk == chunk.chars.uniq.join
      puts i + 4
      break
    end
    i += 1
  end
end

def part_2 input
  i = 0
  while i < input.size
    chunk = input[i, 14]
    if chunk == chunk.chars.uniq.join
      puts i + 14
      break
    end
    i += 1
  end
end

part_1(input)
part_2(input)