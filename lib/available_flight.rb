class AvailableFlight

	attr_accessor :from, :to, :departure, :arrival, :price

	def initialize from, to, departure, arrival, price
		@from = from
		@to = to
		@departure = departure
		@arrival = arrival
		@price = price
	end


end