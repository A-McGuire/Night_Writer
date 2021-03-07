require 'minitest/autorun'
require 'minitest/pride'
require './lib/reader'

class ReaderTest < MiniTest::Test

 def test_it_exists_with_attributes
    reader = Reader.new("..")
    
    assert_instance_of Reader, reader
    assert_equal "..", reader.file
  end
end