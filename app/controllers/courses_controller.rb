class CoursesController < ApplicationController
  before_action :access_rights, only: [:edit, :create, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
    load_course
    if current_user
      # @lesson = @course.lessons.build
    end
    @enrollment = @course.enrollments.build
    @not_enrolled = Enrollment.where(user_id: current_user.id, course_id: @course.id).empty?
    @admin_or_instructor = (current_user.role == "admin" || current_user.role == "instuctor")
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
    load_coarse

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
      params.require(:course).permit(:name, :price, :description, :date)
    end

    def load_course
      @course = Course.find(params[:id])
    end

    def access_rights
      if current_user.role != 'admin' && current_user.role != 'instructor'
        render text: 'Permissions error!'
      end
    end
end
