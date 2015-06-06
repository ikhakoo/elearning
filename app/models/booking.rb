class Booking < ActiveRecord::Base
	belongs_to :user
	has_many :schedules

	def teacher_has_room_for_booking
  	if start_time > schedule.availability(date, start_time)
  		errors.add :start_time, 'not available.'
    end
  end

	def hour_options
		(opening...closing).map do |hour|
			if hour >= 12
				nicehour = hour - 12
				ampm = "pm"
			else
				nicehour = hour
				ampm = "am"
			end
			if nicehour == 0
				nicehour = 12 
			end
			["#{nicehour} #{ampm}", hour]
		end
	end
	
end
