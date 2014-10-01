require 'time'

class FastestFlightFinder
  
  def find_fastest_flight_path(available_flights)
    fastest_flight = fastest_flight_sequence(available_flights)
    convert_to_single_itinerary(fastest_flight)
  end
  
  
  def flight_time(arrival, departure)
   duration = (Time.parse(arrival) - Time.parse(departure))/3600
  end

	def fastest_flight_sequence(available_flights)
    fastest_flight = nil
    available_flights.each do |current_flight| 
      fastest_flight ||= current_flight
      fastest_flight = current_flight if current_flight.flight_time(current_flight.arrival, current_flight.departure) < fastest_flight.flight_time(fastest_flight.arrival, fastest_flight.departure)
    end
    
    fastest_flight
	end
    
  
	def convert_to_single_itinerary(fastest_flight)
    [fastest_flight.departure, fastest_flight.arrival, fastest_flight.price]
  end



end