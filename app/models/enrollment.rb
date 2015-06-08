class Enrollment < ActiveRecord::Base
	belongs_to :course
	belongs_to :user

	def progress
		
	end
end
