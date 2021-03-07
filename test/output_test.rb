require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/output'

class OutputTest < MiniTest::Test

 def test_it_exists_with_attributes
    output = Output.new("new_file.txt", "00\n00\n..")
    assert_instance_of Output, output
  end
end