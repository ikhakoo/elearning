class Schedule < ActiveRecord::Base
	belongs_to :user
	has_many :bookings
	serialize :time

	def availability(date, start_time)
		current_availability = booking.where(date: date, start_time: start_time)
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
