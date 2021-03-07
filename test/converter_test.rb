require './test/test_helper'
# require 'minitest/autorun'
# require 'minitest/pride'
require './lib/converter'

class ConverterTest < MiniTest::Test

 def test_it_exists_with_attributes
    converter = Converter.new
    assert_instance_of Converter, converter
  end

  def test_it_converts_one_letter
    assert_equal ["00", "00", ".."], Converter.convert("g")
  end
  
  def test_it_converts_one_word
    assert_equal ["00.00.0.0.", "0.0..0.0..", "0...0000.."], Converter.convert("pizza")
  end
  
  def test_it_converts_two_words
    assert_equal ["0.0...0.0.", "......0.0.", ".........."], Converter.convert("aa bb")
  end
end