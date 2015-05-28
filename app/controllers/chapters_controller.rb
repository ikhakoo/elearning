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
    @chapter = Chapter.new(chapter_params)

    if @chapter.save
      redirect_to chapters_url
    else
      render :new
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
