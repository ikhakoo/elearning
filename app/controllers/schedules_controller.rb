class SchedulesController < ApplicationController

	def new
		@user = load_user
    @schedule = @user.schedules.build
  end

	def show
		@schedule = Schedule.find(params[:id])

	  if current_user
	    @booking = @schedule.bookings.build
	  end
	end

 private

 	def load_user
    @user = User.find(params[:user_id])
  end

end
