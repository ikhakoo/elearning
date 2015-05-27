class Lesson < ActiveRecord::Base
	belongs_to :course

	def wl_show
		self.will_learn.split()
	end

	def wb_show
		self.will_build.split()
	end

end
