require_relative 'flight_finder'

IO.foreach('input.txt') do |line_eval|
	if line_eval.class?(Integer)
		num_available_flights = line_eval
		x = 0
		available_flights_hash = {}
		while 
			x <= num_available_flights
				available_flights_hash << line_eval.next
			x += 1	
		end

	else line_eval.next
	end

	puts available_flights_hash
		
end


