def jmdsum bytes
  bytes.reduce(0) { |sum, byte| sum * 256 + byte }
end

puts 'Type any message to calculate the unique checksum:'
puts "JMDSum: #{jmdsum gets.bytes}"