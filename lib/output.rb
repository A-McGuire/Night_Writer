class Output
  def initialize(new_file, converted)
    @new_file = new_file
    write(new_file, converted)
  end

  def write(new_file, converted)
    File.open(new_file, "w") do |f|   
      f.write(converted)   
    end
  end
end