require File.join(File.expand_path(File.dirname(__FILE__)), 'file_parser')
require File.join(File.expand_path(File.dirname(__FILE__)), 'flight_creator')
require File.join(File.expand_path(File.dirname(__FILE__)), 'available_flight')
require File.join(File.expand_path(File.dirname(__FILE__)), 'fastest_flight_finder')
require File.join(File.expand_path(File.dirname(__FILE__)), 'cheapest_flight_finder')

class CheapestFastestRouteFinder
  
  def initialize flight_file
  end
  
  def find_the_flight_paths flight_file
    open_data_file = FileParser.new(flight_file).open_and_parse_flight_file(flight_file)
    all_flight_data_sets = FlightCreator.new(open_data_file).evaluate_flight_data(open_data_file)
    flight_paths = iterate_flight_data_sets(all_flight_data_sets)
  end
    
  def iterate_flight_data_sets all_flight_data_sets 
    starting_location = AvailableFlight.new("A A nil nil nil")
    number_of_flight_sets = all_flight_data_sets.length
    x = 0 
    while x < number_of_flight_sets
      flight_data_set = all_flight_data_sets[x]
      cheapest_flight = CheapestFlightFinder.new.find_cheapest_flight_path(flight_data_set, starting_location)
      puts "Here is the cheapest flight itinerary inside the main #{cheapest_flight}. Need to price edge case"
      fastest_flight = FastestFlightFinder.new.find_fastest_flight_path(flight_data_set)
      puts "Here is fastest flight inside the main #{fastest_flight}"
      x += 1
    end
    puts "Behold, the cheapest flight itinerary - #{cheapest_flight}"
    puts "And also, the fastest flight itinerary- #{fastest_flight}"
  end
  
end

CheapestFastestRouteFinder.new('input.txt').find_the_flight_paths('input.txt')
