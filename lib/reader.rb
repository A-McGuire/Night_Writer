class Reader
  attr_reader :file
  def initialize(file)
    @file = file
  end

  def char_count #incorrect, counting "\n"s
    file.sum do |ele|
      ele.chomp.length
    end
  end
end