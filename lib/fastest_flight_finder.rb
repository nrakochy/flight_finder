require File.join(File.expand_path(File.dirname(__FILE__)), 'available_flight_pool_reducer')
require 'time'

class FastestFlightFinder
  
  
  def find_fastest_flight_path valid_flight_options
    fastest_flight_path = identify_fastest_flight_sequence(valid_flight_options)
    fastest_flight_path_with_cost = add_total_cost_of_flight_path(fastest_flight_path)
    summarize_total_flight_details(fastest_flight_path_with_cost)
  end

    
  
  def identify_fastest_flight_sequence arr_of_valid_flight_options
    fastest_flight_path = nil
    arr_of_valid_flight_options.each do |valid_path_arr|
      fastest_flight_path ||= valid_path_arr
      fastest_flight_path = valid_path_arr if valid_path_arr.last.arrival < fastest_flight_path.last.arrival
    end
    fastest_flight_path
  end    
  
  def add_total_cost_of_flight_path(fastest_flight_path)
    fastest_flight_path_with_cost = []
    if fastest_flight_path.length == 1
      fastest_flight_path_with_cost = [fastest_flight_path, fastest_flight_path.last.price]
    else
      cost_of_flight_path = 0
      fastest_flight_path.each do |flight_route| 
        cost_of_flight_path = 0
        cost_of_flight_path += flight_route.price
      end
      fastest_flight_path_with_cost = [fastest_flight_path, cost_of_flight_path]
    end
    fastest_flight_path_with_cost
  end
  
  
  def summarize_total_flight_details(fastest_flight_path_with_cost)
    departure_time = fastest_flight_path_with_cost[0].first.departure
    arrival_time = fastest_flight_path_with_cost[0].last.arrival
    cost = fastest_flight_path_with_cost[1]
    
   [departure_time, arrival_time, cost]
    
  end
  
end


  
