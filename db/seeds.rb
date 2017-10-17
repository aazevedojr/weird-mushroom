# Helpers:

def generate_bookmark
  rand.to_s[2..5] + '-0000-' + rand.to_s[2..5] + '-' + rand.to_s[2..5]
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
  user = User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: "password"
  )
  puts "Created user: #{user.username.upcase}"
end

users = User.all

# Challenges:

puts "Creating challenges..."

chal_1 = Challenge.create(
  theme: Faker::Job.key_skill,
  guidelines: Faker::TwinPeaks.quote,
  course_submissions_deadline: DateTime.now.next_day(7),
  review_submissions_deadline: DateTime.now.next_day(14),
  proposer: users.sample
)

chal_2 = Challenge.create(
  theme: Faker::RockBand.name,
  guidelines: Faker::Simpsons.quote,
  course_submissions_deadline: DateTime.now.next_day(10),
  review_submissions_deadline: DateTime.now.next_day(15),
  proposer: users.sample
)

puts "#{chal_1.theme}, by #{chal_1.proposer.username}"
puts "#{chal_2.theme}, by #{chal_2.proposer.username}"

# Courses:

puts "Creating courses..."

users.each do |user|
  cour_1 = Course.create(
    bookmark: generate_bookmark,
    title: Faker::Book.title,
    maker: user,
    challenge: Challenge.first
  )

  cour_2 = Course.create(
    bookmark: generate_bookmark,
    title: Faker::Pokemon.move,
    maker: user,
    challenge: Challenge.second
  )
  puts "#{cour_1.title}, by #{cour_1.maker.username}, for #{cour_1.challenge.theme}"
  puts "#{cour_2.title}, by #{cour_2.maker.username}, for #{cour_2.challenge.theme}"
end

courses = Course.all

# Reviews:

puts "Creating reviews..."

users.each do |user|
  courses.each do |course|
    if course.maker != user
      Review.create(
        rating: rand(5) + 1,
        feedback: Faker::HarryPotter.quote,
        reviewer: user,
        course: course
      )
    end
  end
  puts "#{user.username.upcase}:"
  user.reviews.each do |review|
    puts review.course.title
    puts '☆' * review.rating
    puts review.feedback
  end
end
