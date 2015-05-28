class LessonsController < ApplicationController
  before_action :logged_in?

  def index
    @course = load_course
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
    params.require(:lesson).permit(:name, :description, :will_learn, :will_build, :course_id, :video_url)
  end

  def load_course
    Course.find(params[:course_id])
  end

  def logged_in?
    if current_user.nil?
      render text: "You must be logged in to see lessons!"
    end
  end
end
