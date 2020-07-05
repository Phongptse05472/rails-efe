json.course @course.each do |course|
  # json.created_at l(course.created_at, format: :default)
  json.id course.id
  json.name course.name
  json.name course.description
  # json.band t(musician.band, scope: 'bands')
end
