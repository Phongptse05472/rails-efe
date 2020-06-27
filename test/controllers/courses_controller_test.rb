require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should get new" do
    get new_course_url
    assert_response :success
  end

  test "should create courses.rb" do
    assert_difference('Course.count') do
      post courses_url, params: { course: { courseImage: @course.courseImage, courseName: @course.courseName, description: @course.description, isFree: @course.isFree, rating: @course.rating } }
    end

    assert_redirected_to course_url(Course.last)
  end

  test "should show courses.rb" do
    get course_url(@course)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_url(@course)
    assert_response :success
  end

  test "should update courses.rb" do
    patch course_url(@course), params: { course: { courseImage: @course.courseImage, courseName: @course.courseName, description: @course.description, isFree: @course.isFree, rating: @course.rating } }
    assert_redirected_to course_url(@course)
  end

  test "should destroy courses.rb" do
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end
end
