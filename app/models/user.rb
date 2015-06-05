class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_and_belongs_to_many :chapters_completed, :class_name => "Chapter", :join_table => "chapters_users"

  def completed?(chapter)
    chapters_completed.include? chapter
  end


  def progress(lesson)
    "%0.2f" % (chapters_completed.where(lesson: lesson).count / lesson.chapters.count.to_f)
  end

  def is_admin?
  	self.role != 'instructor' && self.role != 'student'
  end

  def is_instructor?
  	self.role != 'admin' && self.role != 'student'
  end


  before_save :ensure_there_is_a_role

  def ensure_there_is_a_role
    if role.blank?
      self.role = "student"
    end
  end



  # def chapter_percentage
  #   (self.chapters.count / @lesson.chapters.count) * 100
  # end

  # def chapter_remaining
  #   @lesson.chapters.count - self.chapters.count
  # end

  # Not sure if you need #is_student?; by default the user is a student
  # def is_student?
  # 	self.role != 'instructor' && self.role != 'admin'
  # end
end
