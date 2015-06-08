FactoryGirl.define do
  factory :lesson, aliases: [:first, :second] do
    name "Dev Ops"
    description "Learning how to learn"
    will_learn "Test data.\nIn factory lesson, in lesson test file.\nSuper duper super."
    will_build "This is test text.\nTesting the method.\nHacker's paradise."
    lesson_count 1

    # associations
    course
    chapters {create_list :chapter, 4}
  end

end
