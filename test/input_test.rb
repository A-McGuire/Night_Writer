require './test/test_helper'
require './lib/input'

class InputTest < MiniTest::Test

  def test_it_exists_with_attributes
    file = mock
    input = Input.new(file)
    assert_equal 0, input.char_count
    assert_equal [], input.data
  end
  
  def test_read_file
    file = './sample_txt/over_40.txt'
    input = Input.new(file)
    input.read(file)
    assert_equal 50, input.char_count
    assert_equal 50, input.data.size
  end
  
  def test_chunk_data
    file = mock
    input = Input.new(file)
    input.stubs(:data).returns(['a', 'b', 'c', 'd'])
    assert_equal ['ab', 'cd'], input.chunk_data(2)
  end
end