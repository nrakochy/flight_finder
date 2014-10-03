class AvailableFlightPoolReducer


  def reduce_invalid_departure_sites_and_times_from_starting_point(current_location, last_arrival_time, all_available_flights)
    routes_backwards_reduction = does_not_go_backwards(current_location, all_available_flights)
    routes_location_reduction = reduce_available_departure_sites(current_location, routes_backwards_reduction)
    valid_flight_options = eliminate_departure_times_in_the_past(last_arrival_time, routes_location_reduction) 
  end
  
  def reduce_invalid_departure_sites_and_times_from_destination_point(current_destination, last_arrival_time, all_available_flights)
    routes_forward_reduction = does_not_go_forward(current_destination, all_available_flights)
    routes_location_reduction = reduce_available_departure_sites(current_destination, routes_forward_reduction)
    valid_flight_options = eliminate_departure_times_in_the_future(last_arrival_time, routes_location_reduction) 
  end

  def does_not_go_backwards(current_location, available_flights)
    alphabet_locations = ('A'..'Z').to_a
    reduced_flight_pool = []
    advanced_locations = alphabet_locations.delete_if{|possible_location| possible_location < current_location}
    available_flights.each{|flight_obj| reduced_flight_pool.push(flight_obj) if advanced_locations.include?(flight_obj.from)}
    reduced_flight_pool
  end
  
  
  def reduce_available_departure_sites(current_destination, available_flights)
    reduced_available_flights = []
    available_flights.each{|possible_flight| reduced_available_flights.push(possible_flight) if current_destination.include?(possible_flight.from)}
    reduced_available_flights
  end
  
  def eliminate_departure_times_in_the_past(last_arrival_time, available_flights)
    available_flights.delete_if{|flight| flight.departure.to_i < last_arrival_time.to_i}
  end
  
  def reduce_available_destination_sites(current_destination, available_flights)
    reduced_available_flights = []
    available_flights.each{|possible_flight| reduced_available_flights.push(possible_flight) if current_destination.include?(possible_flight.to)}
    reduced_available_flights
  end
 
  def does_not_go_forward(current_destination, available_flights)
    alphabet_locations = ('A'..'Z').to_a
    reduced_flight_pool = []
    backwards_locations = alphabet_locations.delete_if{|possible_destination| possible_destination > current_destination}
    available_flights.each{|flight_obj| reduced_flight_pool.push(flight_obj) if backwards_locations.include?(flight_obj.to)}
    reduced_flight_pool
  end
  
  def eliminate_departure_times_in_the_future(last_departure_time, available_flights)
    available_flights.delete_if{|flight| flight.arrival.to_i > last_departure_time.to_i}
  end

end