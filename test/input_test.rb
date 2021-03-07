require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/input'
# require './lib/output'

class InputTest < MiniTest::Test

  def test_it_exists_with_attributes
    file = mock
    input = Input.new(file, "new_file")
    assert_equal 0, input.char_count
    assert_equal [], input.data
  end

  def test_chunk_data
    file = mock
    input = Input.new(file, 'new_file')
    input.stubs(:data).returns(['a', 'b', 'c', 'd'])
    assert_equal ['ab', 'cd'], input.chunk_data(2)
  end
end