require File.join(File.expand_path(File.dirname(__FILE__)), 'flight_creator')
require File.join(File.expand_path(File.dirname(__FILE__)), 'available_flight')
require File.join(File.expand_path(File.dirname(__FILE__)), 'fastest_flight_finder')
require File.join(File.expand_path(File.dirname(__FILE__)), 'cheapest_flight_finder')

class CheapestFastestRouteFinder
  
  def find_the_flight_paths(textfile)
    starting_location = AvailableFlight.new('A', nil, "00:00", nil, nil)
    all_flight_data_sets = FlightCreator.new.evaluate_flight_data
    all_flight_data_sets.each do |data_set|
      cheapest_flight = CheapestFlightFinder.new.cheapest_flight_path(data_set, starting_location)
      sleep(2)
      puts cheapest_flight
      fastest_flight = FastestFlightFinder.new.fastest_flight_path(data_set)
      sleep(2)
      puts fastest_flight
    end
  end
  
end

CheapestFastestRouteFinder.new.find_the_flight_paths('input.txt')
