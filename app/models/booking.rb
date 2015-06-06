class Booking < ActiveRecord::Base
	belongs_to :user
	has_many :schedules
end
