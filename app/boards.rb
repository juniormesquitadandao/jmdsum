def boards size
  max = size ** 2
  list1 = [' - '] * max
  position = 0

  loop do
    list2 = list1.dup
    list2[position] = ' @"'

    size.times do |i| 
      i = ((i + 1) * size) - 1
      list2[i] = "#{list2[i]}\n"
    end

    puts `clear`
    puts list2.join

    puts "Type new position, or less than 0, or greater than #{max - 1} to exit:"
    position = gets.to_i

    break if !(0...max).include? position 
  end
end

puts 'Type size of board:'
size = gets.to_i
boards size
