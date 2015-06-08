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

  def create
    load_user
    @schedule = @user.schedules.build(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html do
          redirect_to new_user_schedule_path, notice: 'Schedule created successfully'
        end
        format.js
      else
        format.html { render new_user_schedule_path, alert: 'There was an error' }
      end
    end
  end

 private

 	def load_user
    @user = current_user
  end

  def schedule_params
    params.require(:schedule).permit(:date, :user_id, :time => [])
  end

end
