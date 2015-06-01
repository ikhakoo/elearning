class Chapter < ActiveRecord::Base
  belongs_to :lesson

  def next
  	id + 1
  end

  def before
  	if id === 1
  		id
  	else
  		id - 1
  	end
  end
end