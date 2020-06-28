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
c.avatar = Faker::Internet.url
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
  c.avatar = Faker::Internet.url
  c.save!
end

puts "\n...Seeing Courses...\n"
(100101..100105).each do |x1|
  c1 = Course.find_or_initialize_by(id: x1)
  c1.name = Faker::Name.name
  c1.image = Faker::Internet.url
  c1.description = Faker::Lorem.paragraphs
  c1.rate = Faker::Number.within(1..5)
  c1.is_free = Faker::Boolean.boolean
  c1.is_save = Faker::Boolean.boolean
  c1.is_owner = Faker::Boolean.boolean
  c1.number_enrollment = Faker::Number.within(1..10)
  c1.enrollment_date = Faker::Date.between(from: '2020-05-23', to: '2021-09-25')
  c1.save!
end



