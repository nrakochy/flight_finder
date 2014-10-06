require 'date'
class AvailableFlight
  
	attr_accessor :from, :to, :departure, :arrival, :price

  #"A C 09:00 11:00 200"
  def initialize flight_object_data_string
    array_of_flight_data = flight_object_data_string.split(" ")
    #departure_time_object = flight_time_object_creator(array_of_flight_data[2])
    #arrival_time_object = flight_time_object_creator(array_of_flight_data[3])
    
    
    @from = array_of_flight_data[0] 
    @to = array_of_flight_data[1]
    @departure = array_of_flight_data[2]
    @arrival = array_of_flight_data[3]
    #@departure = departure_time_object
    #@arrival = arrival_time_object
    @price = array_of_flight_data[4].to_i
    
    [@from, @to, @departure, @arrival, @price]
  end
    
  def flight_time_object_creator time_string
    DateTime.strptime(time_string, '%H:%M')
  end


end
