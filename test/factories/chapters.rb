FactoryGirl.define do

  factory :chapter do
    title "Chapter title"
    content "Super content"

    factory :first_chapter do
      chapter_count 1
      lesson
    end

    # factory :last_chapter do
    #   chapter_count
    # end
  end



end
