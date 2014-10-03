require File.join(File.expand_path(File.dirname(__FILE__)), 'available_flight_pool_reducer')

class CheapestFlightFinder
  
  DESTINATION = 'Z'
  SECONDS_IN_HOUR = 3600
    
  def find_cheapest_flight_path(all_available_flights, starting_point_obj)
    current_location = starting_point_obj.from
    last_arrival_time = starting_point_obj.arrival
    flight_routes_taken = []
    flight_obj = starting_point_obj
    cheapest_choice = starting_point_obj
    
    while cheapest_choice.to != DESTINATION
      valid_flight_options = AvailableFlightPoolReducer.new.reduce_invalid_departure_sites_and_times_from_starting_point(current_location, last_arrival_time, all_available_flights)
      cheapest_choice = find_cheapest_choice(valid_flight_options)
      flight_routes_taken.push(cheapest_choice)
      cheapest_choice.class
      current_location = cheapest_choice.to
      last_arrival_time = cheapest_choice.arrival
      cheapest_choice
    end
    
    flight_itinerary = sum_total_flight_details(flight_routes_taken)
    puts "Here is the cheapest flight itinerary inside the cheapest_flight_itinerary #{flight_itinerary}. Need to price edge case"
    
  end

  def find_cheapest_choice(valid_flight_options)
    cheapest_choice = nil
    valid_flight_options.each do |valid_flight| 
      cheapest_choice ||= valid_flight
      cheapest_choice = valid_flight if valid_flight.price < cheapest_choice.price
    end
    cheapest_choice
  end

  
  def sum_total_flight_details(total_flight_routes)
    departure_time = total_flight_routes.first.departure
    arrival_time = total_flight_routes.last.arrival
    cost = 0
    total_flight_routes.each{|flight_obj| cost += flight_obj.price}
    
   [departure_time, arrival_time, cost]
    
  end
  
  def flight_time(arrival, departure)
    duration = (Time.parse(arrival) - Time.parse(departure))/SECONDS_IN_HOUR
  end
  
end