class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_and_belongs_to_many :chapters_completed, :class_name => "Chapter", :join_table => "chapters_users"

  #check if chapter is completed
  def completed?(chapter)
    chapters_completed.include? chapter
  end

  #calculate progress of lesson
  def progress(lesson)
    "%0.2f%" % (chapters_completed.where(lesson: lesson).count / lesson.chapters.count.to_f * 100)
  end

  #calculate if the lesson is completed
  def completed_lesson?(lesson)
    chapters_completed.where(lesson: lesson).count == lesson.chapters.count 
  end

  #check if admin
  def is_admin?
  	self.role != 'instructor' && self.role != 'student'
  end

  #check if instructor
  def is_instructor?
  	self.role != 'admin' && self.role != 'student'
  end

  #check if student
  def is_student?
    self.role != 'instructor' && self.role != 'admin'
  end


  before_save :ensure_there_is_a_role

  #set role to student prior to initial registration
  def ensure_there_is_a_role
    if role.blank?
      self.role = "student"
    end
  end
  
end
