class EnrollmentsController < ApplicationController
  # Must be a user (or logged in) to use this controller
  before_action :access_rights

  add_breadcrumb "My Courses", :enrollments_path

  def index
    if !current_user.is_admin?
      # display all courses enrolled in for student or instructor
      @user = current_user
      @courses_enrolled_in = @user.courses
    else
      render text: "Info not available."
    end
  end

	def new
    load_course
    @enrollment = @course.enrollments.new
  end

  def create
  	if current_user.is_admin?
      redirect_to courses_path, alert: "Please contact admissions for enrollment."
    else
      load_course
      @enrollment = @course.enrollments.new(course_id: @course.id, user_id: current_user.id)

    	if @enrollment.save
         redirect_to enrollments_path, notice: 'Registration created successfully. Please check your e-mail for confirmation'
        # UserMailer.conf_email(current_user).deliver_now
      else
        redirect_to root_path, notice: 'Registration failed. Please try again'
      end
    end

  end

  def edit
  end

  def destroy
  end

private
  def load_course
    @course = Course.find(params[:course_id])
  end

end
