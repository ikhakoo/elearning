class ChaptersController < ApplicationController

  def index
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @chapters = Chapter.all
  end

  def show
    @chapter = Chapter.find(params[:id])

  end

  def new
    @chapter = Chapter.new
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

private
    def load_lesson
      @lesson = Lesson.find(params[:lesson_id])
    end

    def chapter_params
      params.require(:chapter).permit(:title, :content, :lesson_id)
    end
end
