class Lesson < ActiveRecord::Base
	belongs_to :course
	has_many :chapters

	def wl_show
		self.will_learn.split()
	end

	def wb_show
		self.will_build.split()
	end

	# <iframe width="854" height="510" src="https://www.youtube.com/embed/0TEyAPae_f0" frameborder="0" allowfullscreen></iframe>
	def video_id
		if video_url =~ /https?:\/\/(?:(?:www\.)?youtube\.com\/watch\?v=|youtu\.be\/)(.+)/
			$1
		# else
		# 	raise "Cannot find youtube video url"
		end
	end

end
