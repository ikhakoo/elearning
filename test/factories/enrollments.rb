FactoryGirl.define do
  factory :enrollment do
    course_id
    user_id
    # association course, factory: :course
    # association user, factory: :user
  end

end
