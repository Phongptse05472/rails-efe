puts "\n...Seeding customers....\n"
#role
r1 = Role.find_or_initialize_by(id: 1)
r1.name = 'admin'
r1.save!

r2 = Role.find_or_initialize_by(id: 2)
r2.name = 'mentor'
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
(100101..100102).each do |x|
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
(100101..100110).each do |x1|
  c1 = Course.find_or_initialize_by(id: x1)
  c1.name = Faker::Name.name
  # c1.image = Faker::Internet.url
  c1.description = Faker::Lorem.paragraphs
  c1.rate = Faker::Number.within(range: 1..5)
  c1.is_free = Faker::Boolean.boolean
  c1.is_save = Faker::Boolean.boolean
  c1.is_owner = Faker::Boolean.boolean
  c1.number_enrollment = Faker::Number.within(range: 1..10)
  c1.enrollment_date = Faker::Date.between(from: '2020-05-23', to: '2021-09-25')
  c1.save!
end

puts "\n ...seeing Article...\n"
(100101...100111).each do |x2|
  c2 = Article.find_or_initialize_by(id: x2)
  c2.title = Faker::Educator.course_name
  c2.description = Faker::Lorem.paragraphs
  c2.link_article = Faker::Internet.url
  c2.tag = Faker::Verb.base
  c2.duration = Faker::Time.backward(days: 5, period: :morning, format: :short)
  c2.number_complete = Faker::Number.within(range: 1..10)
  c2.view_number = Faker::Number.within(range: 1..100)
  c2.is_free = Faker::Boolean.boolean
  c2.is_favor = Faker::Boolean.boolean
  c2.is_owner = Faker::Boolean.boolean
  c2.link_file_attach = Faker::Internet.url
  c2.save!
end

puts "\n ...seeing Topic...\n"
(1...3).each do |x3|
  c3 = Topic.find_or_initialize_by(id: x3)
  c3.name = Faker::Name.first_name
  c3.save!
end



