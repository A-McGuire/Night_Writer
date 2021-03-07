require './lib/input'
require './lib/converter'
require './lib/output'


input = Input.new(IO.read(ARGV[0]))
p "Created '#{ARGV[1]}' containing #{input.char_count} characters"
Output.new(ARGV[1], input.translate_chunks)

