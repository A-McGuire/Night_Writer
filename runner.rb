require './lib/input'

input = Input.new(ARGV[0], ARGV[1])
input.read(ARGV[0])
input.print_to_terminal

# p "00 .0 0. 0. 0."
# p "0. 0. .0 .0 .."
# p "0. .. 00 00 .."