file_name = '7_input.txt'
input = File.read(file_name)

@sizes = Hash.new

def part_1 input
  limit = 100000
  sum = 0
  path = '/'
  @sizes['/'] = 0
  input.split(/\n/).each do |line|
    if line[0] == '$'
      _, instruction, filename = line.split
      case instruction
      when 'cd'
        if filename == '..'
          new_path, last_folder = path.split(/\/([^\/]+)\/?$/)
          path = new_path
        else
          path += '/' unless path == '/'
          path += filename unless filename == '/'
        end
      end
    else
      size, filename = line.split
      if size != 'dir'
        @sizes['/'] += size.to_i
        tmp_path = path
        while tmp_path != '' && tmp_path != '/'
          if @sizes[tmp_path].nil?
            @sizes[tmp_path] = size.to_i
          else
            @sizes[tmp_path] += size.to_i
          end
          tmp_path, _ = tmp_path.split(/\/([^\/]+)\/?$/)
        end
      end
    end
  end
  @sizes.each do |folder, size|
    if size <= limit
      sum += size
    end
  end
  puts sum
end

def part_2 input
  disk_space = 70000000
  update_space = 30000000
  used_space = @sizes['/']
  unused_space = disk_space - used_space
  min = used_space
  @sizes.values.each do |folder|
    if unused_space + folder > update_space && folder < min
      min = folder
    end
  end
  puts min
end

part_1(input)
part_2(input)