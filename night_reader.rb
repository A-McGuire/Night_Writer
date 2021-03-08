require './lib/reader'

# reader = Reader.new(IO.read(ARGV[0]))
reader = Reader.new(File.readlines(ARGV[0]))
p "Created #{ARGV[1]} containing #{reader.char_count} characters."