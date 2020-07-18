json.extract! course, :name, :image, :description, :is_free, :is_save, :is_owner, :rate, :number_enrollment, :enrollment_date, :image
json.url course_url(course, format: :json)
