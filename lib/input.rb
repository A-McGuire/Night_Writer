require './lib/output'

class Input
  attr_reader :char_count,
              :converted

  def initialize(file, new_file)
    @new_file = new_file
    @char_count = 0
    @converted = ''
    @line1 = ''
    @line2 = ''
    @line3 = ''
    @hash = {
  "a" => ["0.", "..", ".."],
  "b" => ["0.", "0.", ".."],
  "c" => ["00", "..", ".."],
  "d" => ["00", ".0", ".."],
  "e" => ["0.", ".0", ".."],
  "f" => ["00", "0.", ".."],
  "g" => ["00", "00", ".."],
  "h" => ["0.", "00", ".."],
  "i" => [".0", "0.", ".."],
  "j" => [".0", "00", ".."],
  "k" => ["0.", "..", "0."],
  "l" => ["0.", "0.", "0."],
  "m" => ["00", "..", "0."],
  "n" => ["00", ".0", "0."],
  "o" => ["0.", ".0", "0."],
  "p" => ["00", "0.", "0."],
  "q" => ["00", "00", "0."],
  "r" => ["0.", "00", "0."],
  "s" => [".0", "0.", "0."],
  "t" => [".0", "00", "0."],
  "u" => ["0.", "..", "00"],
  "v" => ["0.", "0.", "00"],
  "w" => [".0", "00", ".0"],
  "x" => ["00", "..", "00"],
  "y" => ["00", ".0", "00"],
  "z" => ["0.", ".0", "00"],
  " " => ["..", "..", ".."]
       }
  end

  def read(file)
    File.open(file).each_char do |char|
      @char_count += char.length
      converter(char)
    end
  Output.new(@new_file, @converted)
  end
    
  def print_to_terminal
    p "Created '#{@new_file}' containing #{@char_count} characters"
  end

  def converter(char)
    @line1 += @hash[char][0]
    @line2 += @hash[char][1]
    @line3 += @hash[char][2]
    @converted = "#{@line1}\n#{@line2}\n#{@line3}"
  end
end
