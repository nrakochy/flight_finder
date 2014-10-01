require_relative 'flight_creator'

class CheapestFastestRouteFinder
  
  def find_the_flight_paths(textfile)
    all_flight_data_sets = FlightCreator.new(textfile)
    all_flight_data_sets.each do |data_set|
      cheapest_flight = CheapestFlightFinder.new.cheapest_flight_path(data_set)
      sleep(2)
      puts cheapest_flight
      fastest_flight = FastestFlightFinder.new.fastest_flight_path(data_set)
      sleep(2)
      puts fastest_flight
    end
  end
  
end

CheapestFastestRouteFinder.new.find_the_flight_paths('input.txt')
