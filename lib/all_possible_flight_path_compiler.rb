require 'pry'
require 'date'

class AllPossibleFlightPathCompiler
	
  def initialize starting_point, destination, departure_time, flight_data_set
  end
  
#MAIN
  def find_all_possible_flight_path_route_options starting_point, destination, departure_time, flight_data_set
    all_possible_flight_path_data_sets = []
    originating_flight_paths = identify_flight_paths_that_originate_at_starting_point(starting_point, flight_data_set) # add back departure_time
    originating_flights_that_terminate = identify_flight_paths_which_terminate_at_destination(originating_flight_paths, destination, flight_data_set) # add back departure_time
    originating_flights_that_terminate.each{|terminating_arr| all_possible_flight_path_data_sets << terminating_arr}
    # NON-TERMINATING-BUILDER
    non_terminating_flight_paths_from_origin = identify_originating_flights_which_do_not_terminate_at_destination(originating_flight_paths, destination) # add_back departure_time
    all_compiled_possible_flight_paths = create_possible_flight_path_routes(non_terminating_flight_paths_from_origin, flight_data_set, destination) # add_back departure_time
    all_compiled_possible_flight_paths.each{|terminating_arr| all_possible_flight_path_data_sets << terminating_arr}
    all_possible_flight_path_data_sets 
  end
  
	def identify_flight_paths_that_originate_at_starting_point starting_point, flight_data_set #departure_time
	  originating_flights = []
    flight_data_set.each{|flight_obj| originating_flights.push([flight_obj]) if flight_obj.from == starting_point} #&& flight_obj.departure.to_i >= departure_time }
    originating_flights
	end
      
#NON-TERMINATING-FLIGHT-PATH-BUILDER	
  def identify_originating_flights_which_do_not_terminate_at_destination array_of_flights, destination, #departure_time
    flights_which_do_not_terminate_at_destination = []
    array_of_flights.each{|origin_flight| flights_which_do_not_terminate_at_destination << origin_flight if origin_flight.last.to != destination} #&& origin_flight.departure.to_i >= departure_time}   
    flights_which_do_not_terminate_at_destination     
  end
  #METHOD-MAKER
  def compile_flight_path_possibilities array_of_arrays_of_possible_flight_paths, destination, flight_data_set #departure_time
    flight_paths_which_terminate = []
    flight_paths_and_routes_array = array_of_arrays_of_possible_flight_paths
    
    while flight_paths_and_routes_array > 0
      flight_paths_and_routes_array.map do |flight_path_arr|
        possible_flight_paths = create_possible_flight_path_routes(flight_path_arr, destination, flight_data_set)
        terminating_flight_paths = identify_flight_paths_which_terminate_at_destination(possible_flight_paths, destination, flight_data_set)
        flight_paths_which_terminate << terminating_flight_paths
        possible_flight_paths.delete(terminating_flights)
        flight_paths_and_routes_array = possible_flight_paths
      end
    end
        
  end
  
  #HELPER METHODS - ID TERMINATING
  def identify_flight_paths_which_terminate_at_destination array_of_possible_flight_paths, destination, flight_data_set #departure_time   
    flight_paths_which_terminate_at_destination = []
    array_of_possible_flight_paths.map{|arr_of_possible_routes| flight_paths_which_terminate_at_destination << arr_of_possible_routes if check_for_terminating_route?(arr_of_possible_routes, destination)}
    flight_paths_which_terminate_at_destination
  end
  
  def check_for_terminating_route? flight_array, destination
    flight_array.last.to == destination   
  end
  
  #HELPER METHODS - FIND NEXT ROUTE ON PATH  
  def create_possible_flight_path_routes array_of_arrays_of_flights, destination, flight_data_set #departure_time
    possible_flight_paths = []
    array_of_arrays_of_flights.each do |flight_path_arr|
      next_routes = find_next_possible_route_on_flight_path(flight_path_arr.last, flight_data_set, destination) #departure_time)
      next_routes.each do |next_route|
        flight_path_arr << next_route
        possible_flight_paths << flight_path_arr
      end
    end
    possible_flight_paths
  end
  
  def find_next_possible_route_on_flight_path current_flight_obj, destination, flight_data_set #departure_time
    next_possible_routes = []
    flight_data_set.each do |flight_obj_from_flight_data_set|
      next_possible_routes << flight_obj_from_flight_data_set if check_for_valid_departure_point_and_time?(current_flight_obj, flight_obj_from_flight_data_set) #departure_time,
    end
    next_possible_routes
  end
  
  def check_for_valid_departure_point_and_time? current_flight_obj, flight_obj_from_flight_data_set #departure_time
    flight_obj_from_flight_data_set.from == current_flight_obj.to # && flight_obj_from_data_set.departure >= current_flight_obj.arrival
  end
  
     

      
  
    
end