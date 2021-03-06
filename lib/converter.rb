

@line1 = ''
@line2 = ''
@line3 = ''

def converter(char)
  @line1 += @hash[char][0]
  @line2 += @hash[char][1]
  @line3 += @hash[char][2]
end

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
# @hash = {
#   "a" => ["", "", ".."],
#   "b" => ["b1", "b2", "b3"],
#   "c" => ["c1", "c2", "c3"]
#        }
       