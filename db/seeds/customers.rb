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
(100101..100120).each do |x|
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

  #

end

