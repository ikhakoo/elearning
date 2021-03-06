class CoursesController < ApplicationController
  before_action :access_rights, only: [:new, :edit, :create, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
    load_course
    if current_user
      @enrollment = @course.enrollments.build
      @not_enrolled = Enrollment.where(user_id: current_user.id, course_id: @course.id).empty?
      @admin_or_instructor = admin_or_instructor?
    end
  end

  def new
    @course = Course.new
  end

  def edit
    load_course
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to courses_url
    else
      render :new
    end
  end

  def update
    load_course

    if @course.update_attributes(course_params)
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    load_course
    @course.destroy
    redirect_to courses_path
  end

  private
    def course_params
      if current_user.is_admin?
        params.require(:course).permit(:name, :price, :description, :date)
      else
        params.require(:course).permit(:name, :description, :date)
      end
    end

    def load_course
      @course = Course.find(params[:id])
    end

end
