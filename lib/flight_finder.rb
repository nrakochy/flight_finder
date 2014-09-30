require 'time'

class FastestFlightFinder

	attr_accessor :fastest_flight
  
  def flight_time(arrival, departure)
   (Time.parse(arrival) - Time.parse(departure)).abs
  end

	def fastest_flight_sequence(available_flights)
    fastest_flight = []
    available_flights.each do |flight_arr| 
      fastest_flight = flight_arr  if 
    end
    fastest_flight
	end

	def self.convert_to_single_itinerary(fastest_flight)
    itinerary = [fastest_flight[2],fastest_flight[3], fastest_flight[4]]
	end

	def self.cheapest_flight_sequence(available_flights)
    available_flights
	end




end