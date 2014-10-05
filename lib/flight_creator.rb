require File.join(File.expand_path(File.dirname(__FILE__)), 'available_flight')


class FlightCreator
  
  FLIGHT_ARRAY_INDICATOR = 4
      
  def initialize parsed_flight_file_data_array
  end
  
  def evaluate_flight_data parsed_flight_file_data_array
    all_flight_objects_in_data_file = create_all_flight_objects(parsed_flight_file_data_array) 
    all_available_flight_data_sets = create_all_flight_data_sets(all_flight_objects_in_data_file)
  end
  
  def create_all_flight_objects parsed_flight_file_data_array
    all_flights = []
    num_flights_available = []
    parsed_flight_file_data_array.each do |line_arr|
      if line_arr.length <= FLIGHT_ARRAY_INDICATOR && line_arr.to_i != 0
        num_flights_available << line_arr.to_i
      elsif line_arr.length > FLIGHT_ARRAY_INDICATOR
        all_flights << make_flight_object(line_arr)  
      else line_arr.next
      end
    end
    parsed_flights = [num_flights_available, all_flights]
  end
  

  def create_all_flight_data_sets(parsed_flights)
    num_available_flights = parsed_flights[0]
    all_flights = parsed_flights[1]
    all_available_flights_set = []
    
    num_available_flights.map do |num_of_flights|
      flight_data_set = []
      x = 0
      while x < num_of_flights
        flight_data_set << all_flights.shift
        x += 1
      end
      all_available_flights_set << flight_data_set
    end
    all_available_flights_set
  end
  
  def make_flight_object(flight_data)
    AvailableFlight.new(flight_data)
  end
end

