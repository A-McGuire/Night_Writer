require_relative './converter'

class SanitizeEnglish
  attr_reader :data

  def initialize(file)
    @data = file.gsub("\n", "").chars
  end
  
  def to_braille
    chunk_data(40).flat_map do |chunk|
      Converter.convert_to_braille(chunk)
    end
  end

  def chunk_data(chunk_size)
    chunked = []
    data.each_slice(chunk_size) do |chunk|
      chunked << chunk.join
    end
    chunked 
  end

  def char_count
    @data.count
  end
end

