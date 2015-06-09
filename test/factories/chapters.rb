FactoryGirl.define do

  factory :chapter do
    title "Chapter title"
    content "Super content"

    factory :first_chapter do
      title "First chapter of first lesson"
      chapter_count 1
      lesson {create :first_lesson}
    end

    factory :last_chapter do
      title "Last chapter of last lesson."
      chapter_count 6
      lesson {create :last_lesson, name: "Last lesson of Web Dev 101."}
    end

  end


end
