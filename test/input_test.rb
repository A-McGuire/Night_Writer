require './test/test_helper'
require './lib/input'

class InputTest < MiniTest::Test

  def test_it_exists_with_attributes
    input = Input.new("string")
    assert_equal Array, input.data.class
    assert_equal ["s", "t", "r", "i", "n", "g"], input.data
  end
  
  def test_chunk_data
    input = Input.new("abcd")
    input2 = Input.new("ab cd")

    assert_equal ['ab', 'cd'], input.chunk_data(2)
    assert_equal ['ab', ' c', "d"], input2.chunk_data(2)
  end
  
  def test_char_count
    input = Input.new("abcd")
    input2 = Input.new("ab cd")

    assert_equal 4, input.char_count
    assert_equal 5, input2.char_count
  end
end