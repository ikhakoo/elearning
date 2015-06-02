class Chapter < ActiveRecord::Base
  belongs_to :lesson
  has_one :course, through: :lesson
  has_many :steps

  def next
  	if !last_of_course?
	  	if chapter_count != lesson.chapters.count
		  	lesson.chapters.where(chapter_count: chapter_count + 1).first
		  else
		  	course.lessons.where(lesson_count: lesson.lesson_count + 1).first.chapters.where(chapter_count: 1).first
		  end
		end
  end

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

  def first_of_course?
  	chapter_count == 1 && lesson.lesson_count == 1
  end

  def last_of_course?
  	chapter_count == lesson.chapters.count && lesson.lesson_count == lesson.lesson_count
  end

end