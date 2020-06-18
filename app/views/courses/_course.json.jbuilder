json.extract! course, :id, :CourseName, :CourseImage, :CourseDescription, :Rating, :NumberEnrollment, :IsFree, :created_at, :updated_at
json.url course_url(course, format: :json)
