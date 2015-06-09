FactoryGirl.define do
  factory :lesson do
    name "First Lesson of Web Dev 101"
    description "Learning how to learn"
    will_learn "Test data.\nIn factory lesson, in lesson test file.\nSuper duper super."
    will_build "This is test text.\nTesting the method.\nHacker's paradise."

    factory :first_lesson do
      name "1st lesson of Web Dev 101."
      lesson_count 1

      # associations
      course
      chapters { create_pair :chapter, chapter_count: 2 }
    end

    factory :last_lesson do
      name "3rd and last lesson of Web Dev 101."
      lesson_count 3

      # associations
      course {create :course_of_last_lesson}
      chapters {create_list :chapter, 6, title: "This chapter belongs to the last lesson of the course."}
    end

  end

end
