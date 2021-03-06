class LessonsController < ApplicationController
  before_action :access_rights
  add_breadcrumb "My Courses", :enrollments_path

  def index
    @course = load_course
    @lessons = Lesson.all
    add_breadcrumb @course.name, :course_lessons_path
  end


  def show
    @course = load_course
    @lesson = Lesson.find(params[:id])
  end

  def new
    @course = load_course
    @lesson = @course.lessons.build
  end

  def update
    @course = load_course
    @lesson = Lesson.find(params[:id])

    if @lesson.update_attributes(lesson_params)
      redirect_to course_lesson_path
    else
      render :edit
    end
  end

  def edit
    @course = load_course
    @lesson = Lesson.find(params[:id])
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
    redirect_to course_lessons_path
  end


private
  def lesson_params
    params.require(:lesson).permit(:name, :description, :will_learn, :will_build, :course_id, :video_url)
  end

  def load_course
    Course.find(params[:course_id])
  end
end
