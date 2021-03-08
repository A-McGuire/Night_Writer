require './lib/Sanitize_braille'

Sanitize_braille = SanitizeBraille.new(File.readlines(ARGV[0]))

File.open(ARGV[1], 'w') { |file| file.write(Sanitize_braille.to_english) }

p "Created #{ARGV[1]} containing #{Sanitize_braille.char_count} characters."