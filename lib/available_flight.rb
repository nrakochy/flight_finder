require 'time'
class AvailableFlight
  
	attr_accessor :from, :to, :departure, :arrival, :price

  def initialize flight_object_data_string
    array_of_flight_data = flight_object_data_string.split(" ")
    @from = array_of_flight_data[0] 
    @to = array_of_flight_data[1]
    @departure = array_of_flight_data[2]
    @arrival = array_of_flight_data[3]
    @price = array_of_flight_data[4].to_i
    
    [@from, @to, @departure, @arrival, @price]
  end
    
  def flight_time arrival, departure
   (Time.parse(arrival) - Time.parse(departure))/3600
  end


  
end