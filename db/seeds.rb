# Helpers:

def generate_bookmark
  rand.to_s[2..11] + '-0000-' + rand.to_s[2..11] + '-' + rand.to_s[2..11]
end

def validate(instance)
  if instance.save
    puts "Created #{instance.class}: #{instance.id}"
  else
    instance.errors.messages.each do |error_message|
      puts error_message
    end
  end
end

# Clean up:

puts "Removing existing seed data..."

User.delete_all
Challenge.delete_all
Course.delete_all
Review.delete_all

puts "Removed all existing seed data."

# Me:

puts "Creating users..."

User.create(
  username: "gus",
  email: "gus@weirdmushroom.net",
  password: "gus"
)

puts "Created user: GUS"

# Users:

10.times do
  user = User.new(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: "password"
  )
  validate(user)
end

users = User.all

#Challenges:

puts "Creating challenges..."

chal_1 = Challenge.new(
  theme: Faker::Job.key_skill,
  guidelines: Faker::TwinPeaks.quote,
  course_submissions_deadline: DateTime.now.next_day(7),
  review_submissions_deadline: DateTime.now.next_day(14),
  proposer: users.sample
)

chal_2 = Challenge.new(
  theme: Faker::RockBand.name,
  guidelines: Faker::Simpsons.quote,
  course_submissions_deadline: DateTime.now.next_day(10),
  review_submissions_deadline: DateTime.now.next_day(15),
  proposer: users.sample
)

validate(chal_1)
validate(chal_2)

# Courses:

puts "Creating courses..."

users.each do |user|
  cour_1 = Course.new(
    bookmark: generate_bookmark,
    title: Faker::Book.title,
    maker: user,
    challenge: Challenge.first
  )

  cour_2 = Course.new(
    bookmark: generate_bookmark,
    title: Faker::Pokemon.move,
    maker: user,
    challenge: Challenge.second
  )

  validate(cour_1)
  validate(cour_2)

end

courses = Course.all

# Reviews:

puts "Creating reviews..."

users.each do |user|
  courses.each do |course|
    if course.maker != user
      review = Review.new(
        rating: rand(5),
        feedback: Faker::HarryPotter.quote,
        reviewer: user,
        course: course
      )
      validate(review)
    end
  end
end
