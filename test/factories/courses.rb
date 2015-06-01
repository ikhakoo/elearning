FactoryGirl.define do
  factory :course do
    name 'Test Course'
    description 'learning things!'
    price 2000
  end

  factory :invalid_course, parent: :course do
    price -10
  end

end
