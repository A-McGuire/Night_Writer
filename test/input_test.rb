require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/input'

class InputTest < MiniTest::Test

 def test_it_exists_with_attributes
    braille = mock
    file = "./sample_txt/one_line.txt"
    file2 = "./sample_txt/one_char.txt"
    input = Input.new(file, braille)
    input2 = Input.new(file2, braille)
    
    assert_instance_of Input, input
    assert_equal 1, input2.char_count
    assert_equal 28, input.char_count
  end

  def test_converter
    braille = mock
    file2 = "./sample_txt/one_char.txt"
    input = Input.new(file2, braille)

    assert_equal "00\n00\n..", input.converter("g")
  end
end