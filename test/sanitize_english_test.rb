require './test/test_helper'
require './lib/sanitize_english'

class SanitizeEnglishTest < MiniTest::Test

  def test_it_exists_with_attributes
    sanitize_english = SanitizeEnglish.new("string")
    assert_equal Array, sanitize_english.data.class
    assert_equal ["s", "t", "r", "i", "n", "g"], sanitize_english.data
  end
  
  def test_chunk_data
    sanitize_english = SanitizeEnglish.new("abcd")
    sanitize_english2 = SanitizeEnglish.new("ab cd")

    assert_equal ['ab', 'cd'], sanitize_english.chunk_data(2)
    assert_equal ['ab', ' c', "d"], sanitize_english2.chunk_data(2)
  end
  
  def test_char_count
    sanitize_english = SanitizeEnglish.new("abcd")
    sanitize_english2 = SanitizeEnglish.new("ab cd")

    assert_equal 4, sanitize_english.char_count
    assert_equal 5, sanitize_english2.char_count
  end
end