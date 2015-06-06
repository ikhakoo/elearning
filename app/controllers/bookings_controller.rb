class BookingsController < ApplicationController
	def new
  	@booking = Booking.new
  end

  def create
  	load_schedule
  
  	@booking = @schedule.bookings.build(booking_params)
    @booking.user = current_user

  	if @booking.save
      redirect_to root_path, notice: 'Booking created successfully. Please check your e-mail for confirmation'
      #UserMailer.conf_email(current_user).deliver_now
    else
      redirect_to root_path notice: 'Booking creation failed.'
    end
  end

  def edit
  end

  def destroy
  end

private
  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :date)
  end

  def load_restaurant
    @schedule = Schedule.find(params[:schedule_id])
  end
end
