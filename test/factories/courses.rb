FactoryGirl.define do
  factory :course do
    name 'Test Course'
    description 'learning things!'
    price 2000

    associate :enrollment, factory: :enrollment, strategy: :build

  end

  factory :invalid_course, parent: :course do
    price -10
  end

end
