require './lib/input'
require './lib/converter'
require './lib/output'

input = Input.new(ARGV[0], ARGV[1])
input.read(ARGV[0])
input.print_to_terminal
input.translate

