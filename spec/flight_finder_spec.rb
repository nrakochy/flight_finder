require 'flight_finder'
require 'available_flight'
require 'time'

describe FlightFinder do 
  
	context "when looking for the fastest flight" do
    before :each do 
      @fastest_flight = ['A', 'Z', '09:00', '10:00', 500.00]
      @available_flights = ['A', 'Z', '09:00', '10:00', 500.00], ['A', 'Z', '09:00', '11:00', 400.00], ['A', 'Z', '09:00', '12:00', 300.00], 
      ['A', 'Z', '09:00', '13:00', 200.00], ['A', 'Z', '09:00', '14:00', 100.00]
      @fastest_itinerary = ['09:00', '10:00', 500.00]
    
		end

		it '.fastest_flight_sequence is a working method' do
      expect(FlightFinder.new.fastest_flight_sequence(@fastest_flight)).to eq(@fastest_flight)
		end
    
		it '.fastest_flight_sequence' do
      expect(FlightFinder.new.fastest_flight_sequence(@available_flights)).to eq(@fastest_flight)
		end
    
		xit '.convert_to_single_itinerary' do 
			expect(@cheapest_sequence.convert_to_single_itinerary).to eq(@fastest_itinerary)
		end

	end

	context "when looking for the cheapest flight" do
		before :each do 
      @cheapest_sequence = AvailableFlight.new([nil, nil, '09:00', '10:00', 100.00])
			@cheapest_sequence = FlightFinder.cheapest_flight_sequence
		end

		xit '.cheapest_flight_sequence' do
			expect(@cheapest_sequence).to eq([])
		end
    
		xit '.convert_to_single_itinerary' do 
			expect(@cheapest_sequence.convert_to_single_itinerary).to eq(@cheapest_flight_itinerary)
		end
	end

end