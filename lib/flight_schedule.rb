require_relative 'available_flight'


schedule_set = []

File.readlines(filename, 'r+') do |line_eval|
	if line_eval.class?(Integer)
    while line_eval != nil
      flight_data = line_eval.next
    end
    schedule_set << schedule

	else line_eval.next
	end

	puts schedule_set
		
end


