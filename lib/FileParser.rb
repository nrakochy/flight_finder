class FileParser

  def evaluate_data_file flight_data_file 
    flight_file = File.open(flight_data_file, 'r'){|data_file| data_file.readlines}
    flight_file.each do |line|
      line_detail = line.split(" ")
      if line_detail.class?(Integer)
        x = 1
        while x <= line_detail
          flight_information = line.next
          flight_data = flight_data.split(" ")
          x += 1
        end
      else line.next
    end
  end
  
  def create_data_set num_of_lines_in_set, line
  
    

end