class SchedulesController < ApplicationController

	def show
		@schedule = Schedule.find(params[:id])

	  if current_user
	    @booking = @schedule.bookings.build
	  end
	end


end
