class ChaptersController < ApplicationController
  
  before_filter :load_course, :load_lesson, :setup_breadcrumbs

  def index
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @chapters = @lesson.chapters
  end

  def show
    @course = load_course
    @chapter = Chapter.find(params[:id])
    @lesson = @chapter.lesson
    @next_chapter = @chapter.next
    @prev_chapter = @chapter.before
    add_breadcrumb @chapter.title, course_lesson_chapters_path(@course, @lesson, @chapter)
  end

  def new
    @chapter = Chapter.new
    @lesson = load_lesson
    @course = @lesson.course
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def create
    @lesson = load_lesson
    @course = @lesson.course
    @chapter = @lesson.chapters.build(chapter_params)

    respond_to do |format|
      if @chapter.save
        format.html do
          redirect_to course_lesson_chapter_path(@lesson.id), notice: 'Chapter created successfully'
        end
        format.js
      else
        format.html { render 'lessons/show', alert: 'There was an error' }
      end
    end
  end

  def update
    load_chapter

    if @chapter.update_attributes(chapter_params)
      redirect_to chapter_path(@chapter)
    else
      render :edit
    end
  end

  def destroy
    load_chapter
    @chapter.destroy
    redirect_to chapters_path
  end

 def student_progress
   @user = current_user
   @chapter = Chapter.find(params[:id])
   @user.chapters << @chapter
   flash[:notice] = 'Well Done!'
   redirect_to chapter_path(@chapter)
 end

private
  def setup_breadcrumbs
    add_breadcrumb "My Courses", :enrollments_path
    add_breadcrumb @course.name, :course_lessons_path
    add_breadcrumb @lesson.name, course_lesson_chapters_path(@course, @lesson)
  end

  def load_chapter
    @chapter = Chapter.find(params[:id])
  end

  def load_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def load_course
    @course = Course.find(params[:course_id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :content, :lesson_id)
  end
end
