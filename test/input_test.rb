require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/input'
require './lib/output'

class InputTest < MiniTest::Test

 def test_it_exists_with_attributes
    braille = mock
    file = "./sample_txt/one_line.txt"
    file2 = "./sample_txt/one_char.txt"
    input = Input.new(file, braille)
    input2 = Input.new(file2, braille)
    
    assert_instance_of Input, input
    assert_equal 0, input2.char_count
    assert_equal "", input.converted
  end

  def test_converter
    braille = mock
    file2 = "./sample_txt/one_char.txt"
    input = Input.new(file2, braille)

    assert_equal "00\n00\n..", input.converter("g")
  end

  def test_read_file_one_char
    braille = mock
    file2 = "./sample_txt/one_char.txt"
    input2 = Input.new(file2, braille)

    input2.read(file2)

    assert_equal 1, input2.char_count
    assert_equal "00\n00\n..", input2.converted
  end
end