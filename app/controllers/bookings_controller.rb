class BookingsController < ApplicationController
	
  def new
    @schedule = load_schedule
  	@booking = @schedule.bookings.build
  end

  def create
  	load_schedule
    @user = current_user
  
  	@booking = @schedule.bookings.build(booking_params)
    @booking.user = current_user

  	if @booking.save
      redirect_to interactives_path, notice: 'Booking created successfully. Please check your e-mail for confirmation'
      #UserMailer.conf_email(current_user).deliver_now
    else
      redirect_to interactives_path notice: 'Booking creation failed.'
    end
  end


  def edit
  end

  def destroy
  end

private
  def booking_params
    params.require(:booking).permit(:time, :date)
  end

  def load_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end
end
