require File.join(File.expand_path(File.dirname(__FILE__)), 'available_flight')

class FlightCreator
    
  def evaluate_data_file flight_data_file 
    all_flight_data_sets = []
    flight_data_set= []
    
    flight_file = File.open(File.join(File.expand_path(File.dirname(__FILE__)), "input.txt"), 'r'){|data_file| data_file.readlines}
    flight_file.each do |line|
      data_line = line.split(" ")
      if data_line.count == 1
        num_available_flights = line.to_i
        x = 1
        while x <= num_available_flights
          flight_information = line.next
          flight_data = flight_information.split(" ")
          flight_object = AvailableFlight.new(flight_data[0],flight_data[1], flight_data[2],flight_data[3], flight_data[4])
          flight_data_set << flight_object
          x += 1
        end
        all_flight_data_sets << flight_data_set
      else line.next
      end
    end    
    puts "There are #{all_flight_data_sets.count} available flight data sets"
    
    all_flight_data_sets
  end


end


