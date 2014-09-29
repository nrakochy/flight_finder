
require 'flight_finder'

describe FlightFinder do 


	context "when looking for the fastest flight" do
		before do
			@fastest_sequence = FlightFinder.fastest_flight_sequence
		end

		xit '.fastest_flight_sequence' do
			expect(@fastest_sequence).to eq([])
		end

		xit '.convert_to_single_travel_itinerary' do 
			expect(@fastest_sequence.convert_to_single_itinerary).to eq([])

		end
	end

	context "when looking for the cheapest flight" do
		before do
			@cheapest_sequence = FlightFinder.cheapest_flight_sequence
		end

		xit '.cheapest_flight_sequence' do
			expect(@cheapest_sequence).to eq([])
		end
	end

end