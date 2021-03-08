require './lib/reader'

reader = Reader.new(File.readlines(ARGV[0]))
p "Created #{ARGV[1]} containing #{reader.char_count} characters."
File.open(ARGV[1], 'w') { |file| file.write(reader.to_english) }