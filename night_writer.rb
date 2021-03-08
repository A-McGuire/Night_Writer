require './lib/sanitize_english'
require './lib/output'

sanitize_english = SanitizeEnglish.new(IO.read(ARGV[0]))

Output.new(ARGV[1], sanitize_english.to_braille)

p "Created '#{ARGV[1]}' containing #{sanitize_english.char_count} characters"

