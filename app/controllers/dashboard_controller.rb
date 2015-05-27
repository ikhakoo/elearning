class DashboardController < ApplicationController

  def index
  end

  def tracks
  end

  def students
  	@users = User.all
  end

end
