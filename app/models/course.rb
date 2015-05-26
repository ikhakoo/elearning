class Course < ActiveRecord::Base
	has_many :enrollments
	has_many :users, through: :enrollments
	has_many :lessons

  validates :price, numericality: {greater_than_or_equal_to: 0}

  serialize :will_learn
  serialize :will_build

end
