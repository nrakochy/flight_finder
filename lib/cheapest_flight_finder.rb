class CheapestFlightFinder
  
  STARTING_POINT = 'A'
  DESTINATION = 'Z'
  STARTING_DEPARTURE_TIME = '00:00'
    
  def cheapest_flight_path(all_available_flights)
    current_location = STARTING_POINT
    last_arrival_time = STARTING_DEPARTURE_TIME
    flight_routes_taken = []
    
    while flight_routes_taken.last.to != DESTINATION
      routes_backwards_reduction = all_available_flights.does_not_go_backwards(current_location)
      routes_location_reduction = reduce_available_departure_sites(current_location, routes_backwards_reduction)
      valid_flight_options = eliminate_unavailable_departure_times(last_arrival_time, routes_location_reduction)
      cheapest_choice = find_cheapest_choice(valid_flight_options)
      flight_routes_taken.push(cheapest_choice)
      current_location = cheapest_choice.from
      last_arrival_time = cheapest_choice.arrival
    end
    
    sum_total_flight_details(flight_routes_taken)
    
  end
  
  def flight_time(arrival, departure)
    duration = (Time.parse(arrival) - Time.parse(departure))/3600
  end
  
  def does_not_go_backwards(current_location)
    all_locations = ('A'..'Z').to_a
    all_locations.delete_if{|flight| flight.departure < current_location}
  end
  
  def reduce_available_departure_sites(current_location, reduced_flight_pool)
    reduced_available_flights = []
    reduced_available_flights = reduced_flight_pool.each{|possible_flight| reduced_available_flights.push(possible_flight) if current_location.include?(possible_flight.from)}
  end
  
  def eliminate_unavailable_departure_times(last_arrival_time, reduced_available_flights)
    available_flights.delete_if{|flight| flight.departure.to_i < last_arrival_time.to_i}
  end
  
  def find_cheapest_choice(valid_flight_options)
    cheapest_choice = nil
    valid_flight_options.each do |valid_flight|
      cheapest_choice ||= valid_flight
      cheapest_choice = valid_flight if (valid_flight.price < cheapest_choice.price && valid_flight.flight_time(valid_flight.arrival, valid_flight.departure) < cheapest_choice.flight_time(cheapest_choice.arrival, cheapest_choice.departure)) || valid_flight.price < cheapest_choice.price
    end
  end

  
  def sum_total_flight_details(total_flight_routes)
    departure_time = total_flight_routes.first.departure
    arrival_time = total_flight_routes.last.arrival
    cost = 0
    total_flight_routes.each{|flight_obj| cost += flight_obj.price}
    
   [departure_time, arrival_time, cost]
    
  end
  
end