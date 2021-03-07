require './lib/input'
require './lib/converter'
require './lib/output'

input = Input.new(ARGV[0], ARGV[1])
input.read(ARGV[0])
p "Created '#{ARGV[1]}' containing #{input.char_count} characters"
Output.new(input.new_file, input.translate)

