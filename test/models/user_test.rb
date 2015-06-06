require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user methods against admin" do
    admin = build(:admin)
    assert_equal true, admin.is_admin?
    assert_equal false, admin.is_instructor?
  end

  test "user methods against instructor" do
    instructor = build(:instructor)
    assert_equal false, instructor.is_admin?
    assert_equal true, instructor.is_instructor?
  end

  test "user methods against student" do
    student = build(:student)
    assert_equal false, student.is_admin?
    assert_equal false, student.is_instructor?
  end

  test "user should receive a default role of student" do
    new_user = build(:user)
    new_user.ensure_there_is_a_role
    assert_equal "student", new_user.role

    # No test for the before_save callback. This would be testing rails methods.
  end



end
