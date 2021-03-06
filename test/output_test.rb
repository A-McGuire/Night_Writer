require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/output'

class OutputTest < MiniTest::Test

 def test_it_exists_with_attributes
    new_file = mock
    output = Output.new(new_file, "00\n00\n..")
    assert_instance_of Output, output
  end
  
  def test_write_to_new_file
    output = Output.new("braille.txt", "00\n00\n..")

    output.write("braille.txt", "00\n00\n..")
  end
end