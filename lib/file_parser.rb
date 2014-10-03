class FileParser
  
  def initialize flight_data_file
  end
  
  def open_and_parse_flight_file flight_data_file
    flight_file_with_whitespace = open_file(flight_data_file)
    open_file = flight_file_with_whitespace.map{|line| line.chomp}
    eliminate_first_integer = open_file.slice(0..0)
    open_file - eliminate_first_integer
  end
  
  def open_file flight_data_file
    File.open(File.join(File.expand_path(File.dirname(__FILE__)), flight_data_file), 'r'){|flight_file| flight_file.readlines}
  end
  
  
end