json.extract! course, :id, :courseName, :courseImage, :description, :rating, :isFree, :created_at, :updated_at
json.url course_url(course, format: :json)
