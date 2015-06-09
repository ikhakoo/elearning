require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
  test "first of course method" do
    first_chapter = build(:first_chapter)
    assert_equal true, first_chapter.first_of_course?
  end

  test "last of course method" do
    last_chapter = create(:last_chapter)
    assert_equal true, last_chapter.last_of_course?
  end

  test "if user is at the last chapter of the last course #next method should return nil" do
    last_chapter_of_last_course = create(:last_chapter)
    assert_equal nil, last_chapter_of_last_course.next
  end

end
