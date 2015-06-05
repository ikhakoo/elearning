require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user methods against admin" do
    admin = build(:admin)
    assert_equal true, admin.is_admin?
    assert_equal false, admin.is_instructor?
  end

  test "user methods againts instructor" do
    instructor = build(:instructor)
    assert_equal false, instructor.is_admin?
    assert_equal true, instructor.is_instructor?
  end

  test "user methods against student" do
    student = build(:user)
    assert_equal false, student.is_admin?
    assert_equal false, student.is_instructor?
  end


end
