class DashboardController < ApplicationController
  before_action :access_rights, only: [:students, :destroy]

  def index
  end

  def students
  	@users = if params[:search] && params[:instructors]
      User.where("LOWER(email) LIKE LOWER(?)", "%#{params[:search]}%").where(role: 'instructor')
    elsif params[:search]
      User.where("LOWER(email) LIKE LOWER(?)", "%#{params[:search]}%")
    elsif params[:instructors]
      User.where(role: 'instructor')
    else
      User.where({role: ['student','instructor']})
    end

    respond_to do |format|
      format.html
      format.js

    end

  end

  def destroy
    user_to_be_deleted = User.find(params[:id])
    user_to_be_deleted.delete
    redirect_to(:back)
  end

  def new_instructor
    @instructor = User.new
  end

  def create_instructor
    params[:user][:role] = 'instructor'
    @instructor = User.new(instructor_params)

    if @instructor.save
      redirect_to students_path
    else
      redirect_to :back, alert: "Could not save to database! Try again."
    end

  end

  private
    def instructor_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :role)
    end

    def ensure_role_is_an_instructor
      self.role = "instructor"
    end

end
