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

    test = (1..format.length).group_by do |i|
      i % 3
    end
    test.values[0].each do |value|
      format[value - 1].each_slice(2) do |letter|
        line1 << letter.join
      end
    end
    test.values[1].each do |value|
      format[value - 1].each_slice(2) do |letter|
        line2 << letter.join
      end
    end
    test.values[2].each do |value|
      format[value - 1].each_slice(2) do |letter|
        line3 << letter.join
      end
    end

    converter_format = []
    line1.zip(line2, line3) do |l1, l2, l3|
      converter_format << [l1, l2, l3]
    end
    converter_format
  end

  def to_english
    english = Converter.convert_to_english(to_converter_format)
    english.scan(/.{1,80} /).join("\n")
  end
end