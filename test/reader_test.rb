require 'minitest/autorun'
require 'minitest/pride'
require './lib/reader'

class ReaderTest < MiniTest::Test

 def test_it_exists_with_attributes
    reader = Reader.new([".."])
    
    assert_instance_of Reader, reader
    assert_equal [".."], reader.file
  end
  
  def test_char_count
    reader = Reader.new(["00\n", "00\n", ".."])

    assert_equal 6, reader.char_count
  end

  def test_format_one_letter
    reader = Reader.new(["00\n", "00\n", ".."])
    
    assert_equal [["0", "0"], ["0", "0"], [".", "."]], reader.format
  end
  
  def test_to_converter_format_one_letter
    reader = Reader.new(["00\n", "00\n", ".."])
    reader.format
    assert_equal [["00", "00", ".."]], reader.to_converter_format
  end
  
  def test_to_english_one_letter
    reader = Reader.new(["00\n", "00\n", ".."])
    reader.format
    assert_equal "g",  reader.to_english
  end
end