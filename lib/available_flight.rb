require 'time'
class AvailableFlight
  
	attr_accessor :from, :to, :departure, :arrival, :price

	def initialize from, to, departure, arrival, price
		@from = from
		@to = to
		@departure = departure
		@arrival = arrival
		@price = price
	end
  
  def flight_time(arrival, departure)
   duration = (Time.parse(arrival) - Time.parse(departure))/3600
  end

  
end