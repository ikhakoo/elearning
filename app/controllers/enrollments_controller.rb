class EnrollmentsController < ApplicationController
  # Must be a user (or logged in) to use this controller
  before_action :logged_in?

  def index
    # user must be logged in
    if current_user.role == 'student'
      # display all courses enrolled in
      @user = current_user
      @courses_enrolled_in = @user.courses
    else
      render text: "You are not a student"
    end
  end

	def new
    load_course
    @enrollment = @course.enrollments.new
  end

  def create
  	# If there is a current user:
    load_course
    @enrollment = @course.enrollments.new(course_id: @course.id, user_id: current_user.id)

  	if @enrollment.save
       redirect_to enrollments_path, notice: 'Registration created successfully. Please check your e-mail for confirmation'
      # UserMailer.conf_email(current_user).deliver_now
    else
      redirect_to root_path, notice: 'Registration failed. Please try again'
    end

    # Else redirect to login/sign-up page

  end

  def edit
  end

  def destroy
  end

private
  def logged_in?
    if current_user.nil?
      render text: 'You must be logged in!
      Need to redirect visitor to login / sign-up page.
      After sign-up or login user should be directed back to course enrollment'
    end
  end

  def load_course
    @course = Course.find(params[:course_id])
  end

end
