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
puts "\n...Seeing Mentors & Students...\n"
#mentors & customer accounts
(100101..100105).each do |x|
  u = User.find_or_initialize_by(id: x)
  u.email = Faker::Internet.email
  u.password = Faker::Internet.password
  u.encrypted_password = '#$taawktljasktlw4aaglj'
  u.save!

  c = Customer.find_or_initialize_by(id: x)
  c.role_id = rand(2..3)
  c.user_id = u.id
  c.name = Faker::Name.name
  c.phone_number = Faker::PhoneNumber.phone_number
  c.roll_number = Faker::IDNumber.valid
  c.is_active = Faker::Boolean.boolean
  c.avatar = Faker::Avatar.image
  c.save!
end

puts "\n...Seeing Courses...\n"
(1..20).each do |x1|
  course = Course.find_or_initialize_by(id: x1)
  course.name = Faker::Name.name
  course.author = Faker::Name.name
  # c1.image = Faker::Internet.url
  course.customer_id = c.id_in_database
  course.description = Faker::Lorem.paragraphs
  course.rate = Faker::Number.within(range: 1..5)
  course.is_free = Faker::Boolean.boolean
  course.is_save = Faker::Boolean.boolean
  course.is_owner = Faker::Boolean.boolean
  course.number_enrollment = Faker::Number.within(range: 1..10)
  course.enrollment_date = Faker::Date.between(from: '2020-05-23', to: '2021-09-25')
  course.save!

  puts "\n ...seeing Customer_course..."
    c4 = CustomerCourse.find_or_initialize_by(id: x1)
    c4.customer_id = c.id
    c4.course_id = course.id
    c4.is_owner = Faker::Boolean.boolean
    c4.progression = Faker::Number.within(range: 0...100)
    c4.enrollment_date = Faker::Date.between(from: '2020-05-23', to: '2021-09-25')
    c4.save!
end

puts "\n ...seeing Article...\n"
(1...30).each do |x2|
  c2 = Article.find_or_initialize_by(id: x2)
  c2.title = Faker::Educator.course_name
  c2.author = Faker::Name.name
  c2.description = Faker::Lorem.paragraphs
  c2.link_article = Faker::Internet.url
  # c2.tag_name.push("#java")
  c2.duration = Faker::Time.backward(days: 5, period: :morning, format: :short)
  c2.view_number = Faker::Number.within(range: 1..100)
  c2.is_free = Faker::Boolean.boolean
  c2.link_file_attach = Faker::Internet.url
  c2.save!

  c5 = CustomerArticle.find_or_initialize_by(id: x2)
  c5.customer_id = c.id
  c5.article_id = c2.id
  c5.is_owner = Faker::Boolean.boolean
  c5.time_point = Faker::Time.backward(days: 5, period: :morning, format: :short)
  c5.is_viewed = Faker::Boolean.boolean
  c5.is_favor = Faker::Boolean.boolean
  c5.save!
end

puts "\n ...seeing Topic...\n"
(1...5).each do |x3|
  c3 = Topic.find_or_initialize_by(id: x3)
  c3.name = Faker::Name.first_name
  c3.save!
end





