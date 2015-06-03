class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :enrollments
  has_many :courses, through: :enrollments
  # has_many :steps
  has_many :steps, through: :lessons
  has_and_belongs_to_many :chapters

  def is_admin?
  	self.role != 'instructor' && self.role != 'student'
  end

  def is_instructor?
  	self.role != 'admin' && self.role != 'student'
  end

  # Not sure if you need #is_student?; by default the user is a student
  # def is_student?
  # 	self.role != 'instructor' && self.role != 'admin'
  # end

  before_save :ensure_there_is_a_role

  def ensure_there_is_a_role
    if role.blank?
      self.role = "student"
    end
  end

end
