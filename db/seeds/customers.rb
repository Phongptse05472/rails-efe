# puts "\n...Seeding students....\n"
# #role
# r1 = Role.find_or_initialize_by(id: 1)
# r1.name = 'admin'
# r1.save!
#
# r2 = Role.find_or_initialize_by(id: 2)
# r2.name = 'mentors'
# r2.save!
#
# r3 = Role.find_or_initialize_by(id: 3)
# r3.name = 'student'
# r3.save!
#
# puts "\n...Admin acc...\n"
#
# u = User.find_or_initialize_by(id: 100100)
# u.email = 'admin@edfectively.com'
# u.password = '123@123'
# u.encrypted_password = '#$taawktljasktlw4aaglj'
# u.save!
# #admin accounts\
# c = Customer.find_or_initialize_by(id: 100100)
# c.user_id = u.id
# c.role_id = r1.id
# c.name = 'admin'
# c.phone_number = Faker::PhoneNumber.phone_number
# c.roll_number = Faker::IDNumber.valid
# c.is_active = Faker::Boolean.boolean
# # c.avatar = Faker::Internet.url
# c.save!
# #
# puts "\n...Seeding Mentors & Students...\n"
# #mentors & customer accounts
# (100101..100105).each do |x|
#   u = User.find_or_initialize_by(id: x)
#   u.email = Faker::Internet.email
#   u.password = Faker::Internet.password
#   u.encrypted_password = '#$taawktljasktlw4aaglj'
#   u.save!
#
#   @cus = Customer.find_or_initialize_by(id: x)
#   @cus.role_id = rand(2..3)
#   @cus.user_id = u.id
#   @cus.name = Faker::Name.name
#   @cus.phone_number = Faker::PhoneNumber.phone_number
#   # c.roll_number = Faker::IDNumber.valid
#   # c.is_active = Faker::Boolean.boolean
#   # c.avatar = Faker::Avatar.image
#   @cus.save!
#
# end
#
# puts "\n ...Seeding Group...\n"
# (1...5).each do |x3|
#   @c3 = Group.find_or_initialize_by(id: x3)
#   @c3.name = Faker::Name.first_name
#   @c3.save!
# end
#
# puts "\n...Seeding Courses...\n"
# (1..10).each do |x1|
#   @course = Course.find_or_initialize_by(id: x1)
#   @course.name = Faker::Name.name
#   @course.author = Faker::Name.name
#   # c1.image = Faker::Internet.url
#   # course.customer_id = c.id_in_database
#   @course.description = Faker::Lorem.paragraphs
#   @course.rate = Faker::Number.within(range: 1..5)
#   @course.is_free = Faker::Boolean.boolean
#   # course.level = Faker::Level.
#   @course.number_enrollment = Faker::Number.within(range: 1..10)
#   @course.enrollment_date = Faker::Date.between(from: '2020-05-23', to: '2021-09-25')
#   @course.save!
#
#   end
#
#
#
# puts "\n ...Seeding Article...\n"
# (1...20).each do |x2|
#   @article = Article.find_or_initialize_by(id: x2)
#   @article.title = Faker::Educator.course_name
#   @article.author = Faker::Name.name
#   @article.description = Faker::Lorem.paragraphs
#   @article.link_article = Faker::Internet.url
#   @article.duration = Faker::Time.backward(days: 5, period: :morning, format: :short)
#   @article.view_number = Faker::Number.within(range: 1..100)
#   @article.is_free = Faker::Boolean.boolean
#   @article.link_file_attach = Faker::Internet.url
#   @article.save!
#
#
# end
#
# # puts "\n... Seeding Courses_article..."
# # (1..30).each do |x3|
# #   c8 = CourseArticle.find_or_initialize_by(id: x3)
# #   c8.course_id = @course.id
# #   c8.article_id = @article.id
# #   c8.save!
# # end
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
