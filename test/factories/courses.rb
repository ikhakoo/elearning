FactoryGirl.define do
  factory :course do
    name 'First Course Offerred'
    description 'Web Dev 101: Learning about basic web tech'


    factory :course_of_last_lesson do
      lessons {create_list :lesson, 2}
    end
  end

end
