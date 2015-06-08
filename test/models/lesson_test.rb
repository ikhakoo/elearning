require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test "Will Learn text will be split" do
    lesson_one = build(:lesson)
    split_will_learn = lesson_one.wl_show
    assert_equal ["Test data.", "In factory lesson, in lesson test file.", "Super duper super."], split_will_learn
  end

  test "Will Build text will be split" do
    lesson_one = build(:lesson)
    split_will_build = lesson_one.wb_show
    assert_equal ["This is test text.", "Testing the method.", "Hacker's paradise."], split_will_build
  end

  # No test for #video_id method

end
