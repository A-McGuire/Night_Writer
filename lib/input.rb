class Input
attr_reader :char_count
  def initialize(file, braille)
    @braille = braille
    @char_count = 0
    read(file)
  end

  def converter(char)
    letters_and_braille = {"g" => "00\n00\n.."}
    char = letters_and_braille[char]
  end

  def read(file)
    File.open(file).each_char do |char|
      @char_count += char.length
    end
    # print_to_terminal
  end
  
  def print_to_terminal
    p "Created '#{@braille}' containing #{@char_count} characters"
  end
end
