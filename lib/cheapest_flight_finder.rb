require File.join(File.expand_path(File.dirname(__FILE__)), 'available_flight_pool_reducer')

class CheapestFlightFinder
  
    
  def find_cheapest_flight_path(valid_flight_options)
    flight_paths_with_total_cost = add_total_cost_of_flight_path(valid_flight_options)
    cheapest_flight_path_with_cost = identify_cheapest_flight_path(flight_paths_with_total_cost)
    summarize_total_flight_details(cheapest_flight_path_with_cost)
  end

  def identify_cheapest_flight_path(flight_paths_with_total_cost)
    cheapest_flight_path_with_cost = nil
    
    flight_paths_with_total_cost.each do |flight_path_arr_with_cost|
      cheapest_flight_path_with_cost ||= flight_path_arr_with_cost
      cheapest_flight_path_with_cost = flight_path_arr_with_cost if flight_path_arr_with_cost[1] < cheapest_flight_path_with_cost[1]
    end
    cheapest_flight_path_with_cost
  end
  
  def add_total_cost_of_flight_path(valid_flight_options)
    flight_paths_with_total_cost = []
    valid_flight_options.each do |valid_flight_path| 
      cost_of_flight_path = 0
      if valid_flight_path.length > 1
        valid_flight_path.each{|flight_obj| cost_of_flight_path += flight_obj.price}
        flight_paths_with_total_cost << [valid_flight_path, cost_of_flight_path]
      else 
        flight_paths_with_total_cost << [valid_flight_path, valid_flight_path.first.price]
      end
    end
    flight_paths_with_total_cost
  end
  
    
  
  def summarize_total_flight_details(cheapest_flight_path_with_cost)
    departure_time = cheapest_flight_path_with_cost[0].first.departure
    arrival_time = cheapest_flight_path_with_cost[0].last.arrival
    cost = cheapest_flight_path_with_cost[1]
    
   [departure_time, arrival_time, cost]
    
  end
  
  
end