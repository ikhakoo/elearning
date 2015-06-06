FactoryGirl.define do
  factory :user do
    email "song-about-nothing@wale-music.com"
    password "password"
    role nil
  end

  factory :student, parent: :user do
    role "student"
  end

  factory :admin, parent: :user do
    role "admin"
  end

  factory :instructor, parent: :user do
      role "instructor"
  end
end
