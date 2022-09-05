def boards size
  list1 = [' - '] * (size ** 2)
  x,y = [0, 0]

  loop do
    list2 = list1.dup
    position = (x * size) + y
    list2[position] = ' @"'

    size.times do |i| 
      i = ((i + 1) * size) - 1
      list2[i] = "#{list2[i]}\n"
    end

    puts `clear`
    puts list2.join

    puts "Type new coordenates NxN, or less than 0x0, or greater than #{size - 1}x#{size - 1} to exit:"
    x,y = gets.split('x').map(&:to_i)

    break if !(0...size).include?(x) || !(0...size).include?(y)
  end
end

puts 'Type size of board:'
size = gets.to_i
boards size
