class Lesson < ActiveRecord::Base
	belongs_to :course
	has_many :chapters

	#method to split will learn
	def wl_show
		will_learn.split(/\n/)
	end

	#method to split will build
	def wb_show
		will_build.split(/\n/)
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
