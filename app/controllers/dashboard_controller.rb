class DashboardController < ApplicationController

  def index
  end

  def tracks
  end

  def students
  	@users = if params[:search]
      User.where("LOWER(email) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      User.where(role: 'student')
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

end
