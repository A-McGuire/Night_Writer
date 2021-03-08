require_relative './converter'

class Reader
  attr_reader :file
  def initialize(file)
    @file = file
  end

  def char_count
    file.sum do |ele|
      ele.chomp.length
    end
  end

  def format
    data = file.map do |ele|
      ele.chomp!
      ele.chars
    end
  end
  
  def to_converter_format
    line1 = []
    line2 = []
    line3 = []

    format[0].each_slice(2) do |letter|
      line1 << letter.join
    end
    format[1].each_slice(2) do |letter|
      line2 << letter.join
    end
    format[2].each_slice(2) do |letter|
      line3 << letter.join
    end

    converter_format = []
    line1.zip(line2, line3) do |l1, l2, l3|
      converter_format << [l1, l2, l3]
    end
    converter_format
  end

  def to_english
    Converter.convert_to_english(to_converter_format)
  end
end