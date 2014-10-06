require 'pry'

require File.join(File.expand_path(File.dirname(__FILE__)), 'file_parser')
require File.join(File.expand_path(File.dirname(__FILE__)), 'flight_creator')
require File.join(File.expand_path(File.dirname(__FILE__)), 'available_flight')
require File.join(File.expand_path(File.dirname(__FILE__)), 'all_possible_flight_path_compiler')
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
    answer_set_array = []
    cheapest_fastest_flights = []
    all_flight_data_sets.each do |flight_data_set|     
      starting_location = AvailableFlight.new("A A 00:00 nil nil")
      destination = 'Z'
      all_compiled_possible_flight_paths = AllPossibleFlightPathCompiler.new(starting_location.from, destination, starting_location.departure, flight_data_set).find_all_possible_flight_path_route_options(starting_location.from, destination, starting_location.departure, flight_data_set) 
      puts "IN THE MAIN- Made it with this length of possible_flights #{all_compiled_possible_flight_paths.length} "
      cheapest_flight_path = CheapestFlightFinder.new.find_cheapest_flight_path(all_compiled_possible_flight_paths)
      puts "Here is the cheapest flight path #{cheapest_flight_path}"
      answer_set_array << cheapest_flight_path
      fastest_flight_path = FastestFlightFinder.new.find_fastest_flight_path(all_compiled_possible_flight_paths)
      answer_set_array << fastest_flight_path
      puts "Here is the fastest flight path #{fastest_flight_path}"
      cheapest_fastest_flights << answer_set_array 
    end
    puts "Here is the answer sets #{answer_set_array}"
  end
  
end

CheapestFastestRouteFinder.new('input.txt').find_the_flight_paths('input.txt')
