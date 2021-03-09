require_relative './converter'

class SanitizeBraille
  attr_reader :file
  def initialize(file)
    @file = file
  end

  def to_english
    english = Converter.convert_to_english(to_converter_format)
    if english.size > 80 
      english.scan(/.{1,80} /).join("\n") #adds newline every 80 characters
    else 
      english
    end
  end
  
  def to_converter_format
    line1 = []
    line2 = []
    line3 = []
    create_groups_by_3 # creates hash that associates lines that 
                       # share the same index of a braille character
    @groups.values[0].each do |value| #groups.values[0] == 1, 4 which represent line numbers
      breakdown[value - 1].each_slice(2) do |letter| #value - 1 to account for index 0
        line1 << letter.join #creating an array that contains all 'top' character sections, 
      end                    # with each char section as an element
    end
    @groups.values[1].each do |value|
      breakdown[value - 1].each_slice(2) do |letter|
        line2 << letter.join
      end
    end
    @groups.values[2].each do |value|
      breakdown[value - 1].each_slice(2) do |letter|
        line3 << letter.join
      end
    end
    condense_to_letters(line1, line2, line3) # creates a nested array where each element is a horizontal braille letter 
  end

  def breakdown #removes newlines and formats data into an array of inidividual chars/dots
    file.map do |ele|
      ele.chomp!
      ele.chars
    end
  end
  
  def create_groups_by_3 # creates hash that associates lines that share the same index of a braille character
    @groups = (1..breakdown.length).group_by do |i|
      i % 3
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