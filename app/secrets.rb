def secrets chars:, size:, file_path:
  multiplier = chars.size
  min = multiplier ** (size - 1)
  max = (multiplier ** size) - 1
  File.write file_path, ''

  for jmdsum in min..max do
    printf "\rProgress: %0.100f", jmdsum * 100.to_f / max

    result = []

    size.times.each do |i| 
      byte = jmdsum % multiplier

      result.unshift chars[byte]

      jmdsum /= multiplier
    end

    File.write file_path, "#{result.join}\n", mode: 'a+'
  end

  puts
end

chars = (32..126).to_a.map(&:chr) - [' ', '\\', '"', "'", '`']
puts "Characters: #{chars.join}"
puts 'Type the size of the secrets to be generated:'
size = gets.to_i
file_path = 'tmp/secrets.txt'
puts "Generating #{file_path}..."
secrets chars: chars, size: size, file_path: file_path
puts "Generated #{file_path}"
