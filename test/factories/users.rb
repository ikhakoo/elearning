FactoryGirl.define do
  factory :user do
    first_name "Wale"
    last_name "Akintimehin"
    email "wale@bitmakerlabs.com"
    password "password"
    password_confirmation "password"
    role "student"
  end

  factory :admin, parent: :user do
    role "admin"
  end

  factory :instructor, parent: :user do
      role "instructor"
  end
end
