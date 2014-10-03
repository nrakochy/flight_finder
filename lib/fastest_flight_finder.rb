require File.join(File.expand_path(File.dirname(__FILE__)), 'available_flight_pool_reducer')
require 'time'

class FastestFlightFinder
  
  STARTING_POINT = 'A'
  DESTINATION = 'Z'
  
  def find_fastest_flight_path all_available_flights
    final_flight_route = identify_final_flight_route(all_available_flights)
    fastest_flight_path = identify_fastest_flight_sequence(all_available_flights, final_flight_route)
    sum_total_flight_details(fastest_flight_path)
  end
  
  def identify_final_flight_route all_available_flights
    terminating_flights = identify_flights_terminating_at_destination(all_available_flights)
    final_flight_route = nil
    
    terminating_flights.each do |possible_flight|
      final_flight_route ||= possible_flight
      final_flight_route = possible_flight if possible_flight.arrival.to_i < final_flight_route.arrival.to_i
    end
    
    final_flight_route
  end
  
  def identify_flights_terminating_at_destination all_available_flights
    all_available_flights.delete_if{|flight_obj| flight_obj.to != DESTINATION}
  end
    
  
  def identify_fastest_flight_sequence all_available_flights, final_flight_route
    next_route_destination = final_flight_route.from
    next_arrival_time = final_flight_route.departure
    flight_routes_taken = [final_flight_route]
    flight_obj = final_flight_route
    next_fastest_choice = final_flight_route
    
    while next_fastest_choice.from != STARTING_POINT
        valid_flight_options = AvailableFlightPoolReducer.new.reduce_invalid_departure_sites_and_times_from_destination_point(next_route_destination, next_arrival_time, all_available_flights)
        next_fastest_choice = find_fastest_flight(valid_flight_options)
        flight_routes_taken.unshift(fastest_choice)
        next_route_destination = next_fastest_choice.from
        next_arrival_time = next_fastest_choice.departure
        next_fastest_choice
    end
    
    flight_routes_taken
  end    
  
	def sum_total_flight_details(flight_routes_taken)
    cost = 0
    flight_routes_taken.each{|flight_obj| cost += flight_obj.price}
    [flight_routes_taken.first.departure, flight_routes_taken.last.arrival, cost]
  end
  
end


  
