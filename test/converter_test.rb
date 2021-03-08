require './test/test_helper'
require './lib/converter'

class ConverterTest < MiniTest::Test

 def test_it_exists_with_attributes
    converter = Converter.new
    assert_instance_of Converter, converter
  end

  def test_it_converts_one_letter
    assert_equal ["00", "00", ".."], Converter.convert_to_braille("g")
  end
  
  def test_it_converts_one_word
    assert_equal ["00.00.0.0.", "0.0..0.0..", "0...0000.."], Converter.convert_to_braille("pizza")
  end
  
  def test_it_converts_two_words
    assert_equal ["0.0...0.0.", "......0.0.", ".........."], Converter.convert_to_braille("aa bb")
  end
end