puts "\n...Seeding students....\n"
#role
r1 = Role.find_or_initialize_by(id: 1)
r1.name = 'admin'
r1.save!

r2 = Role.find_or_initialize_by(id: 2)
r2.name = 'mentors'
r2.save!

r3 = Role.find_or_initialize_by(id: 3)
r3.name = 'student'
r3.save!

puts "\n...Admin acc...\n"

u = User.find_or_initialize_by(id: 100100)
u.email = 'admin@edfectively.com'
u.password = '123@123'
u.encrypted_password = '#$taawktljasktlw4aaglj'
u.save!
#admin accounts\
c = Customer.find_or_initialize_by(id: 100100)
c.user_id = u.id
c.role_id = r1.id
c.name = 'admin'
c.phone_number = Faker::PhoneNumber.phone_number
c.roll_number = Faker::IDNumber.valid
c.is_active = Faker::Boolean.boolean
# c.avatar = Faker::Internet.url
c.save!
#
puts "\n...Seeding Mentors & Students...\n"
#mentors & customer accounts
(100101..100105).each do |x|
  u = User.find_or_initialize_by(id: x)
  u.email = Faker::Internet.email
  u.password = Faker::Internet.password
  u.encrypted_password = '#$taawktljasktlw4aaglj'
  u.save!

  @cus = Customer.find_or_initialize_by(id: x)
  @cus.role_id = rand(2..3)
  @cus.user_id = u.id
  @cus.name = Faker::Name.name
  @cus.phone_number = Faker::PhoneNumber.phone_number
  # c.roll_number = Faker::IDNumber.valid
  # c.is_active = Faker::Boolean.boolean
  # c.avatar = Faker::Avatar.image
  @cus.save!

end

puts "\n ...Seeding Topic...\n"
(1...5).each do |x3|
  @c3 = Topic.find_or_initialize_by(id: x3)
  @c3.name = Faker::Name.first_name
  @c3.save!
end

puts "\n...Seeding Courses...\n"
(1..10).each do |x1|
  @course = Course.find_or_initialize_by(id: x1)
  @course.name = Faker::Name.name
  @course.author = Faker::Name.name
  # c1.image = Faker::Internet.url
  # course.customer_id = c.id_in_database
  @course.description = Faker::Lorem.paragraphs
  @course.rate = Faker::Number.within(range: 1..5)
  @course.is_free = Faker::Boolean.boolean
  # course.level = Faker::Level.
  @course.number_enrollment = Faker::Number.within(range: 1..10)
  @course.enrollment_date = Faker::Date.between(from: '2020-05-23', to: '2021-09-25')
  @course.save!

  puts "\n ...Seeding Customer_course..."
  c4 = CustomerCourse.find_or_initialize_by(id: x1)
  c4.customer_id = @cus.id
  c4.course_id = @course.id
  c4.is_owner = Faker::Boolean.boolean
  c4.is_save = Faker::Boolean.boolean
  c4.progression = Faker::Number.within(range: 0...100)
  c4.enrollment_date = Faker::Date.between(from: '2020-05-23', to: '2021-09-25')
  c4.save!

  puts "\n... Seeding Topic_course..."
  (1...15).each do |x4|
    c4 = TopicCourse.find_or_initialize_by(id: x4)
    c4.course_id = @course.id.rand(1..10)
    c4.topic_id = @c3.id
    c4.save!
  end

  puts "\n ...Seeding Customer_course..."
  (1..20).each do |x5|
    c5 = CustomerCourse.find_or_initialize_by(id: x5)
    c5.customer_id = @cus.id
    c5.course_id =  @course.id
    c5.is_owner = Faker::Boolean.boolean
    c5.is_save = Faker::Boolean.boolean
    c5.progression = Faker::Number.within(range: 0..0)
    c5.save!
  end
end


puts "\n ...Seeding Article...\n"
(1...20).each do |x2|
  @article = Article.find_or_initialize_by(id: x2)
  @article.title = Faker::Educator.course_name
  @article.author = Faker::Name.name
  @article.description = Faker::Lorem.paragraphs
  @article.link_article = Faker::Internet.url
  @article.duration = Faker::Time.backward(days: 5, period: :morning, format: :short)
  @article.view_number = Faker::Number.within(range: 1..100)
  @article.is_free = Faker::Boolean.boolean
  @article.link_file_attach = Faker::Internet.url
  @article.save!

  c5 = CustomerArticle.find_or_initialize_by(id: x2)
  c5.customer_id = @cus.id
  c5.article_id = @article.id.rand(1..20)
  c5.is_owner = Faker::Boolean.boolean
  c5.time_point = Faker::Time.backward(days: 5, period: :morning, format: :short)
  c5.is_viewed = Faker::Boolean.boolean
  c5.is_favor = Faker::Boolean.boolean
  c5.save!
end

puts "\n... Seeding Courses_article..."
(1..30).each do |x3|
  c8 = CourseArticle.find_or_initialize_by(id: x3)
  c8.course_id = @course.id.rand(1..10)
  c8.article_id = @article.id.rand(1..20)
  c8.save!
end
























