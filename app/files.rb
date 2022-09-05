require 'fileutils'

def files size:, folder:, extension:
  multiplier = 256
  min = multiplier ** (size - 1)
  max = (multiplier ** size) - 1
  i = 1
  FileUtils.mkdir_p folder
  FileUtils.rm_f Dir.glob("#{folder}/*")

  for jmdsum in min..max do
    printf "\rProgress: %0.100f", jmdsum * 100.to_f / max

    bytes = []
    size.times.each do |i| 
      byte = jmdsum % multiplier

      bytes.unshift byte

      jmdsum /= multiplier
    end
    File.binwrite "#{folder}/#{i}.#{extension}", bytes.pack('C*')

    i += 1
  end

  puts
end

puts 'Type the size of the files to be generated:'
size = gets.to_i
puts 'Type the extension of the files to be generated:'
extension = gets.strip
folder = 'tmp/files'
puts "Generating files in #{folder}..."
files size: size, folder: folder, extension: extension
puts "Generated files in #{folder}"
