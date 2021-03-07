require './test/test_helper'
# require 'minitest/autorun'
# require 'minitest/pride'
# require 'mocha/minitest'
require './lib/output'

class OutputTest < MiniTest::Test

 def test_it_exists_with_attributes
  converted = ["..", "..", ".."]
    output = Output.new("new_file.txt", converted)
    assert_instance_of Output, output
  end
end