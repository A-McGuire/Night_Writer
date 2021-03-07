require './lib/reader'

reader = Reader.new(IO.read(ARGV[0]))
p "Created #{ARGV[1]} containing 256 characters."