require 'minitest/autorun'
require 'minitest/pride'
require './lib/converter'

class ConverterTest < MiniTest::Test

 def test_it_exists_with_attributes
    assert_instance_of Converter, converter
    assert_equal '', converter.line1
    assert_equal '', converter.line2
    assert_equal '', converter.line3
  end
end