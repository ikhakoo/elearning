class ChaptersController < ApplicationController

  def index
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
    def load_course
      @chapter = Chapter.find(params[:id])
    end

    def chapter_params
      params.require(:chapter).permit(:title, :content)
    end
end
