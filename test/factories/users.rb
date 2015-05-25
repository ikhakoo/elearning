FactoryGirl.define do
  factory :user do
    first_name "David"
    Last_name "Banner"
    email "bannerd@bitmakerlabs.com"
    password "password"
    password_confirmation "password"
    role "admin"
  end

end
