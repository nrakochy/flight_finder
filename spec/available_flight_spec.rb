require 'available_flight'

describe AvailableFlight do 


	before do 
		@available_flight = AvailableFlight.new("FROM", "TO", "DEPARTURE", "ARRIVAL", "PRICE")
  end
  

		describe "#FROM" do 
			
			it 'returns FROM departing location' do
				expect(@available_flight.from).to eq 'FROM'
			end
		end

		describe "#TO" do 
			
			it 'returns TO arrival location' do
				expect(@available_flight.to).to eq "TO"
			end
		end

		describe "#DEPARTURE" do 
				
			it 'returns DEPARTURE time' do
				expect(@available_flight.departure).to eq "DEPARTURE"
			end
		end

		describe "#ARRIVAL" do 
			
			it 'returns ARRIVAL time' do
				expect(@available_flight.arrival).to eq "ARRIVAL"
			end
		end

		describe "#PRICE" do 
			
			it 'returns PRICE of flight sequence' do
				expect(@available_flight.price).to eq "PRICE"
			end
		end




end