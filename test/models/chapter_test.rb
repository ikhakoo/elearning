require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
  test "first of course method" do
    first_chapter = build(:chapter)
    # lesson = build(:first_lesson)

    assert_equal true, first_chapter.first_of_course?

  end

  test "last of course method" do
    first_chapter = build(:chapter)
    lesson = build(:first_lesson)

    assert_equal true, first_chapter.first_of_course?

  end

end
