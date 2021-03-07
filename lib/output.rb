class Output
  #initialized w/ name of new file and array of braille
  def initialize(new_file, converted)
    @new_file = new_file
    write(new_file, converted)
  end

  def write(new_file, converted)
    File.open(new_file, "w") do |file| #create new file
      converted.each do |line| #iterate through each ele of braille array
        file.write(line + "\n") #each ele of arr is written in w/ newline at end
      end
    end
  end
end