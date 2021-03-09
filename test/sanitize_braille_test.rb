require 'minitest/autorun'
require 'minitest/pride'
require './lib/sanitize_braille'

class SanitizeBrailleTest < MiniTest::Test

 def test_it_exists_with_attributes
    sanitize_braille = SanitizeBraille.new([".."])
    
    assert_instance_of SanitizeBraille, sanitize_braille
    assert_equal [".."], sanitize_braille.file
  end
  
  def test_char_count
    sanitize_braille = SanitizeBraille.new(["00\n", "00\n", ".."])

    assert_equal 1, sanitize_braille.char_count
  end

  def test_breakdown_one_letter
    sanitize_braille = SanitizeBraille.new(["00\n", "00\n", ".."])
    
    assert_equal [["0", "0"], ["0", "0"], [".", "."]], sanitize_braille.breakdown
  end
  
  def test_to_converter_breakdown_one_letter
    sanitize_braille = SanitizeBraille.new(["00\n", "00\n", ".."])

    sanitize_braille.breakdown

    assert_equal [["00", "00", ".."]], sanitize_braille.to_converter_format
  end
  
  def test_to_english_one_letter
    sanitize_braille = SanitizeBraille.new(["00\n", "00\n", ".."])

    sanitize_braille.breakdown

    assert_equal "g",  sanitize_braille.to_english
  end
  
  def test_create_groups_by_3
    sanitize_braille = SanitizeBraille.new(["00\n", "00\n", ".."])

    expected = {1=>[1], 2=>[2], 0=>[3]}

    assert_equal expected, sanitize_braille.create_groups_by_3
  end
  
  def test_condense_to_letters
    file = ["0.\n", "..\n", "..\n", "0.\n", "..\n", ".."]
    sanitize_braille = SanitizeBraille.new(file)

    sanitize_braille.breakdown
    sanitize_braille.create_groups_by_3
    line1 = ["0.", "0."]
    line2 = ["..", ".."]
    line3 = ["..", ".."]
    assert_equal [["0.", "..", ".."], ["0.", "..", ".."]],
    sanitize_braille.condense_to_letters(line1, line2, line3)
  end
end