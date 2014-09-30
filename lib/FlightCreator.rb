require 'available_flight'
class FlightCreator

  def evaluate_data_file flight_data_file 
    flight_set_number = 0
    all_flight_data_sets = []
    flight_data_set= []
    
    flight_file = File.open(flight_data_file, 'r'){|data_file| data_file.readlines}
    flight_file.each do |line|
      line_detail = line.split(" ")
      if line_detail.class?(Integer)
        x = 1
        while x <= line_detail
          flight_information = line.next
          flight_data = flight_information.split(" ")
          flight_object = AvailableFlight.new(flight_data[0],flight_data[1], flight_data[2],flight_data[3], flight_data[4)]
          flight_data_set << flight_object
          x += 1
        end
        all_flight_data_sets << flight_data_set
      else line.next
    end
    
    all_flight_data_sets
  end
  

end

