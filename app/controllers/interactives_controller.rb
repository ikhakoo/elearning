class InteractivesController < ApplicationController
  before_filter :load_bread

	def index
		@interactives = Interactive.all
	end

  def show
    @interactive = Interactive.find(params[:id])
    add_breadcrumb @interactive.about, interactive_path(@interactive)

  end

	def new
    @interactive = Interactive.new
    add_breadcrumb "Create New Room", :new_interactive_path
  end

  def create
    # make a new interactive with what interactive_params returns (which is a method we're calling)
    @interactive = Interactive.new(interactive_params)
    if @interactive.save
    	if @interactive.password.nil?
    		@interactive.is_private = false
    		@interactive.save
    	else
    		@interactive.is_private = true
    		@interactive.save
    	end
      # if the save for the interactive was successful, go to index.html.erb
      redirect_to interactives_url
    else
      # otherwise render the view associated with the action :new (i.e. new.html.erb)
      render :new
    end
  end

  def edit
    @interactive = Interactive.find(params[:id])
  end

  def update
    @interactive = Interactive.find(params[:id])

    if @interactive.update_attributes(interactive_params)
      redirect_to "/interactives"
    else
      render :edit
    end
  end

  def destroy
    @interactive = Interactive.find(params[:id])
    @interactive.destroy
    redirect_to interactives_url
  end

  private
  def interactive_params
    params.require(:interactive).permit(:url, :is_private, :password, :about)
  end

  def load_bread
    add_breadcrumb "Interactive Hub", :interactives_path
  end

end
