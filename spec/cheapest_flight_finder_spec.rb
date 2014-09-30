require 'cheapest_flight_finder'
require 'available_flights'

describe CheapestFlightFinder
  
	context "when looking for the cheapest flight" do
    before :each do 
      @cheapest_itinerary = ['02:00', '17:00', 300.00]
      @available_flights = [AvailableFlight.new('A', 'Z', '09:00', '10:00', 1000.00), AvailableFlight.new('A', 'B', '02:00', '05:00', 100.00), AvailableFlight.new('B', 'Z', '06:00', '12:00', 700.00), 
      AvailableFlight.new('B', 'F', '09:00', '13:00', 100.00), AvailableFlight.new('F', 'Z', '14:00', '17:00', 100.00)]
      @cheap_finder = CheapestFlightFinder.new
  	end

		xit '.next_cheapest_flight' do
			expect(@cheapfinder.next_cheapest_flight(@available_flights)).to eq(@available_flights[1])
		end
    
    xit '.next_cheapest_flight does not overlap arrival and departure times' do 
    end
    
    xit 'arrives at destination Z' do 
    end

    xit '.sum_total_flight_costs' do
    end
    
		xit '.convert_to_cheapest_itinerary' do 
			expect(@cheapest_sequence.convert_to_single_itinerary).to eq(@cheapest_itinerary)
		end
    
end