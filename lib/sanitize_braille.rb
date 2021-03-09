require_relative './converter'

class SanitizeBraille
  attr_reader :file
  def initialize(file)
    @file = file
  end

  def to_english
    english = Converter.convert_to_english(to_converter_format)
    if english.size > 80 
      english.scan(/.{1,80}/).join("\n") #adds newline every 80 characters
    else 
      english
    end
  end
  
  def to_converter_format
    test = @file.map do |line|
      line.scan(/.{1,2}/)
    end
    create_groups_by_3 
    require 'pry'; binding.pry
    line1 = test.values_at(@index_hash[1].join(" ,").to_i).flatten
    line2 = test.values_at(@index_hash[2].join(" ,").to_i).flatten
    line3 = test.values_at(@index_hash[0].join(" ,").to_i).flatten
    condense_to_letters(line1, line2, line3) # creates a nested array where each element is a horizontal braille letter 
  end
  
  def create_groups_by_3 # creates hash that associates lines that share the same index of a braille character
    groups = (1..@file.length).group_by do |i|
      i % 3
    end
    @index_hash = groups.transform_values do |value|
      value.map do |i|
        i -= 1
      end
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