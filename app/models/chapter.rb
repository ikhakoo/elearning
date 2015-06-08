class Chapter < ActiveRecord::Base
  belongs_to :lesson
  has_one :course, through: :lesson
  has_and_belongs_to_many :completed_by, :class_name => "User", :join_table => "chapters_users"


  #defines the next chapter of the lesson on current chapter
  def next
  	if !last_of_course?
	  	if chapter_count != lesson.chapters.count
		  	lesson.chapters.where(chapter_count: chapter_count + 1).first
		  else
		  	next_les = course.lessons.where(lesson_count: lesson.lesson_count + 1).first
		  	next_les.chapters.where(chapter_count: 1).first
		  end
		end
  end

  #defines previous chapter of the lesson on current chapter
  def before
  	if !first_of_course?
	  	if chapter_count != 1
	  		lesson.chapters.where(chapter_count: chapter_count - 1).first
	  	else
	  		prev_les = course.lessons.where(lesson_count: lesson.lesson_count - 1).first
	  		prev_les.chapters.where(chapter_count: prev_les.chapters.count).first
	  	end
	  end
  end

  #defines 1st chapter and 1st lesson
  def first_of_course?
  	self.chapter_count == 1 && self.lesson.lesson_count == 1
  end

  #define last chapter and last lesson
  def last_of_course?
  	chapter_count == lesson.chapters.count && lesson.lesson_count == course.lessons.count
  end

end