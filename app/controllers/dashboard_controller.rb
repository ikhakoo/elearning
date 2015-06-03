class DashboardController < ApplicationController
  before_action :access_rights, only: :students

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

end
