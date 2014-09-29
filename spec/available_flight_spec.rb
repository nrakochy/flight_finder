require 'available_flight'

describe AvailableFlight do 

	before do 
		@available_flight = AvailableFlight.new("FROM", "TO", "DEPARTURE", "ARRIVAL", "PRICE")
  end

		describe "#FROM" do 
			
			it 'returns FROM departing location' do
				expect(@available_flight).to eq 'FROM'
			end
		end

		describe "#TO" do 
			
			xit 'returns TO arrival location' do
				expect(@available_flight).to eq "TO"
			end
		end

		describe "#DEPARTURE" do 
				
			xit 'returns DEPARTURE time' do
				expect(@available_flight).to eq "DEPARTURE"
			end
		end

		describe "#ARRIVAL" do 
			
			xit 'returns ARRIVAL time' do
				expect(@available_flight).to eq "ARRIVAL"
			end
		end

		describe "#PRICE" do 
			
			xit 'returns PRICE of flight sequence' do
				expect(@available_flight).to eq "PRICE"
			end
		end




end