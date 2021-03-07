require './lib/output'
require './lib/converter'

class Input
  attr_reader :char_count,
              :data

  def initialize(file, new_file) #instantiate w/ user input 
    @new_file = new_file
    @char_count = 0
    @data = []
  end

  def read(file) #opends file, counts the chars, puts chars in array
    File.open(file).each_char do |char|
      @char_count += char.length
      @data << char
    end
    return to_braille(chunk_data(40)) if @char_count > 40 #if data is > 40chars breck it into chucks of 40 chars 
    result = Converter.convert(@data.join) #if data is < 40chars convert it to braille
    Output.new(@new_file, result) # instantiate output with braille and new_file name from user
  end

  def wrap_text?
    true if char_count > 40
    false
  end
  
  def chunk_data(batch_size) #tell the method the size of the chunks you need
    chunked = []
    data.each_slice(batch_size) do |chunk| #groups eles in set batch sizes
      chunked << chunk.join #adds chunks to new array in str format
    end
    chunked #returns array of strings, each ele is a chunk
  end

  def to_braille(chunked_data) #takes in data that has been chunked into specific sizes
    result = []
    chunked_data.each do |chunk| #each chunk converted to braille
      result += Converter.convert(chunk)
    end
    Output.new(@new_file, result)
  end
    
  def print_to_terminal
    p "Created '#{@new_file}' containing #{@char_count} characters"
  end
end
