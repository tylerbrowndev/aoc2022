file_name = '13_input.txt'
input = File.read(file_name)

def part_1 input
  sum = 0
  input.split(/\n\n/).each_with_index do |packets, index|
    first, second = packets.split(/\n/)
    first = convert first
    second = convert second
    if get_match first, second
      sum += index + 1
    end
  end
  puts sum
end

def part_2 input
  packets = []
  product = 1
  input += "[[2]]\n[[6]]\n"
  input.split(/\n/).each do |packet|
    next if packet.empty?
    packet = convert packet
    inserted = false
    packets.each_with_index do |sorted_packet, i|
      comparison = get_match packet, sorted_packet
      if comparison || comparison.nil?
        packets.insert(i, packet)
        if packet == [[2]] || packet == [[6]]
          product *= i + 1
        end
        inserted = true
        break
      end
    end
    if !inserted
      packets.append(packet)
    end
  end
  puts product
end

def convert packet_string
  packet = []
  packet_string = packet_string[1..packet_string.size - 2]
  i = 0
  while i < packet_string.size
    if packet_string[i] == '['
      sub_packet = '['
      i += 1
      while packet_string[i] != ']' && i < packet_string.size
        sub_packet += packet_string[i]
        i += 1
      end
      sub_packet += ']'
      i += 1
      packet.append(convert(sub_packet))
    elsif packet_string != ','
      num = packet_string[i]
      i += 1
      while packet_string[i] != ',' && i < packet_string.size
        num += packet_string[i]
        i += 1
      end
      packet.append(num.to_i)
    end
    i += 1
  end
  packet
end

def get_match left, right
  left_type = left.is_a?(Array) ? 'array' : 'int'
  right_type = right.is_a?(Array) ? 'array' : 'int'
  if left_type == 'int' && right_type == 'array'
    left = [left]
    left_type = 'array'
  end
  if left_type == 'array' && right_type == 'int'
    right = [right]
    right_type = 'array'
  end

  if left_type == 'int' && right_type == 'int'
    return true if left < right
    return false if right < left
  end
  if left_type == 'array' && right_type == 'array'
    i = 0
    while i < left.size && i < right.size
      comparison = get_match left[i], right[i] 
      return comparison if !comparison.nil?
      i += 1
    end
    return true if left.size < right.size
    return false if right.size < left.size
  end
end

part_1(input)
part_2(input)
