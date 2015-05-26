class LessonsController < ApplicationController
 # before_filter :ensure_logged_in, only: [:create, :destroy]

  def index
    @lessons = Lesson.all
  end

  def show
    @course = load_course
    @lesson = Lesson.find(params[:id])
  end

  def new
    @course = load_course
    @lesson = @course.lessons.build
  end

  def create
    @course = load_course
    @lesson = @course.lessons.build(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html do
          redirect_to course_path(@course.id), notice: 'lesson created successfully'
        end
        format.js
      else
        format.html { render 'courses/show', alert: 'There was an error' }
      end
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
  end


private
  def lesson_params
    params.require(:lesson).permit(:name, :description, :course_id)
  end

  def load_course
    @course = Course.find(params[:course_id])
  end

end
