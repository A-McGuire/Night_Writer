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
  
  def test_create_groups_by_3
    reader = Reader.new(["00\n", "00\n", ".."])

    expected = {1=>[1], 2=>[2], 0=>[3]}

    assert_equal expected, reader.create_groups_by_3
  end
  
  def test_condense_to_letters
    file = ["0.\n", "..\n", "..\n", "0.\n", "..\n", ".."]
    reader = Reader.new(file)

    reader.format
    reader.create_groups_by_3
    line1 = ["0.", "0."]
    line2 = ["..", ".."]
    line3 = ["..", ".."]
    assert_equal [["0.", "..", ".."], ["0.", "..", ".."]],
    reader.condense_to_letters(line1, line2, line3)
  end
end