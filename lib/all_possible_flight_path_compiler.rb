require 'pry'

class AllPossibleFlightPathCompiler
	
  def initialize starting_point, destination, flight_data_set
  end
  
#MAIN
  def find_all_possible_flight_path_route_options starting_point, destination, flight_data_set
    all_possible_flight_path_data_sets = []
    originating_flights = identify_flights_that_originate_at_starting_point(starting_point,flight_data_set)
    originating_flights_that_terminate = add_originating_flights_that_terminate_at_destination_to_possible_flight_path_set(originating_flights, destination)
    all_possible_flight_path_data_sets << originating_flights_that_terminate
    binding.pry
    non_terminating_flights_from_origin = identify_flights_which_do_not_terminate_at_destination(originating_flights, destination)
    binding.pry
    all_compiled_possible_flight_paths = create_possible_flight_path_routes(non_terminating_flights_from_origin, flight_data_set, destination)
    binding.pry
    all_possible_flight_path_data_sets << all_compiled_possible_flight_paths
  end
  
	def identify_flights_that_originate_at_starting_point starting_point, flight_data_set
	  originating_flights = []
    flight_data_set.each{|flight_obj| originating_flights.push(flight_obj) if flight_obj.from == starting_point}
    originating_flights
	end

#NON-TERMINATING-FLIGHT-PATH-BUILDER	
  def identify_flights_which_do_not_terminate_at_destination array_of_flights, destination
    flights_which_do_not_terminate_at_destination = []
    array_of_flights.each{|origin_flight| flights_which_do_not_terminate_at_destination << origin_flight if origin_flight.to != destination}   
    flights_which_do_not_terminate_at_destination     
  end
  
  def create_possible_flight_path_routes non_terminating_flights_from_origin, flight_data_set, destination
    all_possible_compiled_flight_path_routes = []
    possible_flight_paths = find_next_possible_route_of_flight_path(non_terminating_flights_from_origin, flight_data_set, destination)
    
    while possible_flight_paths.length != 0
      possible_flight_paths.map! do |arr_of_possible_routes|
        check_for_terminating_route = false
        if check_for_terminating_route?(arr_of_possible_routes, destination)
          all_possible_compiled_flight_path_routes << arr_of_possible_routes 
          possible_flight_paths.delete(arr_of_possible_routes)
          possible_flight_paths
        else next_level_flight_path_finder = find_next_possible_route_of_flight_path(arr_of_possible_routes, flight_data_set, destination)
          possible_flight_paths << next_level_flight_path_finder
        end
      end
    end
          
  end
  
  def find_next_possible_route_of_flight_path non_terminating_flights_from_origin, flight_data_set, destination
    all_possible_flight_paths = [] 
    array_of_arrays_of_possible_flights_from_origin = []
   
    non_terminating_flights_from_origin.each do |origin_flight|
      array_of_arrays_of_possible_flights_from_origin = identify_next_possible_routes_in_sequence(origin_flight.to, flight_data_set)
      array_of_arrays_of_possible_flights_from_origin.map!{|path_arr| path_arr.unshift(origin_flight)}
    end
  end
  
  def identify_next_possible_routes_in_sequence departure_point, flight_data_set
    possible_next_routes_in_sequence = []
    flight_data_set.each do |flight_obj_from_flight_data_set|
      possible_next_routes_in_sequence << [flight_obj_from_flight_data_set] if flight_obj_from_flight_data_set.from == departure_point 
    end
    binding.pry           
    possible_next_routes_in_sequence
  end
     
  def check_for_terminating_route? flight_array, destination
    flight_array.to == destination   
  end
      
   
  
#ORIGINATING THAT TERMINATE AT DESTINATION        
  def identify_flights_which_terminate_at_destination originating_flights, destination
    flights_which_terminate_at_destination = []
    originating_flights.each{|origin_flight| flights_which_terminate_at_destination << origin_flight if origin_flight.to == destination}
    flights_which_terminate_at_destination        
  end
  
  def add_originating_flights_that_terminate_at_destination_to_possible_flight_path_set originating_flights, destination
    all_possible_flight_paths = []
    flights_which_terminate_at_destination = identify_flights_which_terminate_at_destination(originating_flights, destination)
    all_possible_flight_paths << flights_which_terminate_at_destination
  end
  
  
    
end