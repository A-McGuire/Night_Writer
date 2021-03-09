require_relative './converter'

class SanitizeBraille
  attr_reader :file
  def initialize(file)
    @file = file
  end

  def to_english
    english = Converter.convert_to_english(to_converter_format)
    if english.size > 80 
      newline_every_80(english)
    else 
      english
    end
  end

  def newline_every_80(string)
    string.scan(/.{1,80} /).join("\n")
  end
  
  def to_converter_format
    line1 = []
    line2 = []
    line3 = []
    create_groups_by_3
    
    @index_hash.values[0].each do |value|
      breakdown[value].each_slice(2) do |letter| 
        line1 << letter.join
      end
    end
    @index_hash.values[1].each do |value|
      breakdown[value].each_slice(2) do |letter|
        line2 << letter.join
      end
    end
    @index_hash.values[2].each do |value|
      breakdown[value].each_slice(2) do |letter|
        line3 << letter.join
      end
    end
    condense_to_letters(line1, line2, line3)
  end

  def create_groups_by_3
    groups = (1..@file.length).group_by do |i|
      i % 3
    end
    @index_hash = groups.transform_values do |value|
      value.map do |i|
        i -= 1
      end
    end
  end

  def breakdown
    file.map do |ele|
      ele.chomp!
      ele.chars
    end
  end
  
  def condense_to_letters(line1, line2, line3)
    converter_format = []
    line1.zip(line2, line3) do |l1, l2, l3|
      converter_format << [l1, l2, l3]
    end
    converter_format
  end
  
  def char_count
    sum = file.sum do |ele|
      ele.chomp.length
    end
    sum / 6
  end
end