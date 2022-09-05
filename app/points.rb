def encode max
  multiplier = max + 1
  jmdsum = 0

  loop do
    puts "Type new point value, or less than 0 or, greater than #{max} to exit:"
    point = gets.to_i

    if (0..max).include? point 
      jmdsum = (jmdsum * multiplier) + point
    else
      break
    end
  end

  jmdsum
end

def decode max:, jmdsum:
  multiplier = max + 1
  points = []

  while jmdsum > 0 do
    point = jmdsum % multiplier
    points.unshift point
    jmdsum /= multiplier
  end

  points
end

puts 'Type the maximum point value:'
max = gets.to_i
puts "Encoding..."
jmdsum = encode max
puts "Encoded: #{jmdsum}"
puts "Decoding..."
puts "Decoded: #{decode max: max, jmdsum: jmdsum}"
