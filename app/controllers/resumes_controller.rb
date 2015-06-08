class ResumesController < ApplicationController
  #list all resumes (access only available to admins)
  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end
  #need to add user mailer function so admin is notified of the new application
  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      redirect_to root_path, notice: "Hey #{@resume.first_name} #{@resume.last_name}, thanks for applying!"
    else
      redirect_to root_path, alert: "Error: Please try again!"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice:  "The resume for #{@resume.first_name} #{@resume.last_name}, has been deleted."
  end

private
  def resume_params
    params.require(:resume).permit(:first_name, :last_name, :email, :phone, :attachment)
  end
end
