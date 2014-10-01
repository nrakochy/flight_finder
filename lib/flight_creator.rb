require File.join(File.expand_path(File.dirname(__FILE__)), 'available_flight')

class FlightCreator
  
  FLIGHT_ARRAY_INDICATOR = 2
  MINIMUM_FLIGHT_CHOICE = 2
    
  def evaluate_flight_data
    flight_file = open_file
    parsed_flights = parse_flight_data_file(flight_file) 
    all_available_flight_data_sets = create_flight_data_sets(parsed_flights[0], parsed_flights[1])
  end
  
  def parse_flight_data_file flight_file
    all_flights = []
    num_flights_available = []
    
    flight_file.each do |line_arr|
      if line_arr.length == FLIGHT_ARRAY_INDICATOR && line_arr.to_i != MINIMUM_FLIGHT_CHOICE
        num_flights_available << line_arr.to_i
      elsif line_arr.length > FLIGHT_ARRAY_INDICATOR
        all_flights << make_flight_object(line_arr)
      else line_arr.next
      end  
    end
    
    parsed_flights = [num_flights_available, all_flights]
  end
  
  def open_file
   File.open(File.join(File.expand_path(File.dirname(__FILE__)), "input.txt"), 'r'){|data_file| data_file.readlines}
  end
  
  def make_flight_object(flight_data)
    flight_object = AvailableFlight.new(flight_data[0],flight_data[1], flight_data[2],flight_data[3], flight_data[4])
  end

  def create_flight_data_sets (num_flights_available, all_flights)
    flight_data_set = []
    all_available_flights_set = []
    
    x = 0
    num_flights_available.each do |index_length|
      while index_length > x
        flight_data_set << all_flights[x]
        all_flights.delete_at(x)
        all_flights.unshift(nil)
        x += 1
      end
      all_available_flights_set << flight_data_set
    end
  end
end

