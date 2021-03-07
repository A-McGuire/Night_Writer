require_relative './output'
require_relative './converter'

class Input
  attr_reader :char_count,
              :data,
              :new_file

  def initialize(file) #instantiate w/ user input 
    @new_file = new_file
    @char_count = 0
    @data = []
  end

  def read(file) #opends file, counts the chars, puts chars in array
    File.open(file).each_char do |char|
      @char_count += char.length #move to separate method?
      @data << char
    end
  end

  def translate_chunks #takes in data that has been chunked into specific sizes
    chunk_data(40).flat_map do |chunk| #each chunk converted to braille
      Converter.convert(chunk)
    end
  end

  def chunk_data(batch_size) #tell the method the size of the chunks you need
    chunked = []
    data.each_slice(batch_size) do |chunk| #groups eles in set batch sizes
      chunked << chunk.join #adds chunks to new array in str format
    end
    chunked #returns array of strings, each ele is a chunk
  end
end
