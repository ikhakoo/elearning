class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :steps
  has_many :steps, through: :lessons

  def is_admin?
  	self.role = 'admin' 
  end

end
