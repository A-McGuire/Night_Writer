require_relative './converter'

class SanitizeEnglish
  attr_reader :data

  def initialize(file)
    @data = file.gsub("\n", "").chars #removes pesky newlines
  end
  
  def to_braille #takes in data that has been chunked into specific sizes
    chunk_data(40).flat_map do |chunk| #each chunk converted to braille
      Converter.convert_to_braille(chunk)
    end
  end

  def chunk_data(chunk_size) #tell the method the size of the chunks you need
    chunked = []
    data.each_slice(chunk_size) do |chunk| #groups eles in set batch sizes
      chunked << chunk.join #adds chunks to new array in str format
    end
    chunked #returns array of strings, each ele is a chunk
  end

  def char_count
    @data.count
  end
end
