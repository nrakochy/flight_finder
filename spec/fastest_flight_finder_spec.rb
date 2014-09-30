require 'fastest_flight_finder'
require 'available_flight'
require 'time'

describe FastestFlightFinder do 
  
	context "when looking for the fastest flight" do
    before :each do 
      @fastest_flight = AvailableFlight.new('A', 'Z', '09:00', '10:00', 500.00)
      @available_flights = [@fastest_flight, AvailableFlight.new('A', 'Z', '09:00', '11:00', 400.00), AvailableFlight.new('A', 'Z', '09:00', '12:00', 300.00), 
      AvailableFlight.new('A', 'Z', '09:00', '13:00', 200.00), AvailableFlight.new('A', 'Z', '09:00', '14:00', 100.00)]  
      @flight_finder = FastestFlightFinder.new
		end
    
		it '.flight_time outputs flight duration as integer of hours' do
      expect(FastestFlightFinder.new.flight_time(@fastest_flight.arrival, @fastest_flight.departure)).to eq(1.0)
    end
    
    it '.fastest_flight_sequence' do
      expect(FastestFlightFinder.new.fastest_flight_sequence(@available_flights)).to eq(@fastest_flight)
		end
    
		it '.convert_to_single_itinerary' do 
			expect(@flight_finder.convert_to_single_itinerary(@fastest_flight)).to eq([@fastest_flight.departure, @fastest_flight.arrival, @fastest_flight.price])
		end

	end


end