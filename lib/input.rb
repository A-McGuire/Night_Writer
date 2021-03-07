require './lib/output'
require './lib/converter'

class Input
  attr_reader :char_count,
              :data

  def initialize(file, new_file)
    @new_file = new_file
    @char_count = 0
    @data = []
  end

  def read(file)
    File.open(file).each_char do |char|
      @char_count += char.length
      @data << char
    end
    return to_braille(chunk_data(40)) if @char_count > 39
    result = Converter.convert(@data.join)
    Output.new(@new_file, result)
  end
  
  def chunk_data(batch_size)
    chunked = []
    data.each_slice(batch_size) do |chunk|
      chunked << chunk.join
    end
    chunked
  end

  def to_braille(data)
    result = []
    data.each do |chunk|
      result += Converter.convert(chunk)
    end
    Output.new(@new_file, result)
  end
    
  def print_to_terminal
    p "Created '#{@new_file}' containing #{@char_count} characters"
  end
end
